import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:listen_kids_what_is_that/pages/categoryPage/widgets/widgets.dart';
import 'dart:async'; // Timer için ekledik
import 'dart:math';

import 'package:listen_kids_what_is_that/pages/mainPage/main_page.dart';

class InstrumentPageTest extends StatefulWidget {
  const InstrumentPageTest({super.key});

  @override
  State<InstrumentPageTest> createState() => _InstrumentPageTestState();
}

class _InstrumentPageTestState extends State<InstrumentPageTest> {
  final player = AudioPlayer();
  late int dogruCevapIndex;
  List<int> siklar = [];
  late Timer _timer; // Otomatik ses için timer

  final List<String> animals = [
    "PIANO",
    "GUITAR",
    "VIOLIN",
    "FLUTE",
    "CLARINET",
    "DRUM",
    "RATTLE",
    "SAXOPHONE",
    "WHISTLE",
    "BELL",
    "ARP",
    "KALIMBA",
  ];

  @override
  void initState() {
    super.initState();
    _playSoundAutomatically(); // Otomatik sesi başlat
    // Doğru cevabın indexini rastgele belirle
    dogruCevapIndex = Random().nextInt(animals.length);
    // Sikların indexlerini oluştur
    siklar = List.generate(4, (index) => index);
    // Sikların içindeki doğru cevabın indexini rastgele bir yere yerleştir
    siklar.shuffle();
    // Doğru cevabı yerleştir
    int dogruCevapSira =
        Random().nextInt(4); // Doğru cevabın yerleştirileceği sıra
    for (int i = 0; i < 4; i++) {
      if (i == dogruCevapSira) {
        siklar[i] = dogruCevapIndex;
      } else {
        // Doğru cevabın indeksiyle farklı bir indeks seç
        int rastgeleIndex;
        do {
          rastgeleIndex = Random().nextInt(animals.length);
        } while (
            rastgeleIndex == dogruCevapIndex || siklar.contains(rastgeleIndex));
        siklar[i] = rastgeleIndex;
      }
    }
    print(dogruCevapIndex);
  }

  @override
  void dispose() {
    player.stop(); // Sayfa kapatıldığında sesi durdur
    _timer.cancel(); // Timer'ı iptal et
    super.dispose();
  }

  void _playSoundAutomatically() {
    const Duration autoPlayDuration =
        Duration(milliseconds: 500); // Otomatik oynatma süresi
    _timer = Timer(autoPlayDuration, () async {
      String audioPath = ("sounds/enstruman/${animals[dogruCevapIndex]}.mp3");
      await player.play(AssetSource(audioPath));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {
          _timer.cancel(); // Sayfa kapatıldığında timer'ı iptal et
          player.stop(); // Sayfa kapatıldığında sesi durdur
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        },
        child: const Icon(Icons.close),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: SoruSiklari(
                        animals: animals,
                        index: siklar[0], // İlk seçenek
                        isDogruCevap: siklar[0] ==
                            dogruCevapIndex, // Doğru cevabı kontrol et
                        onAnswered: _onAnswered,
                      ),
                    ),
                    const DividerContainer(
                      width: 4,
                    ),
                    Expanded(
                      child: SoruSiklari(
                        animals: animals,
                        index: siklar[1], // İkinci seçenek
                        isDogruCevap: siklar[1] ==
                            dogruCevapIndex, // Doğru cevabı kontrol et
                        onAnswered: _onAnswered,
                      ),
                    ),
                  ],
                ),
              ),
              const DividerContainer(
                height: 4,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: SoruSiklari(
                        animals: animals,
                        index: siklar[2], // Üçüncü seçenek
                        isDogruCevap: siklar[2] ==
                            dogruCevapIndex, // Doğru cevabı kontrol et
                        onAnswered: _onAnswered,
                      ),
                    ),
                    const DividerContainer(
                      width: 4,
                    ),
                    Expanded(
                      child: SoruSiklari(
                        animals: animals,
                        index: siklar[3], // Dördüncü seçenek
                        isDogruCevap: siklar[3] ==
                            dogruCevapIndex, // Doğru cevabı kontrol et
                        onAnswered: _onAnswered,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: FloatingActionButton.large(
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(Icons.volume_up),
              onPressed: () async {
                _timer.cancel(); // Butona basıldığında timer'ı iptal et
                String audioPath =
                    ("sounds/enstruman/${animals[dogruCevapIndex]}.mp3");
                await player.play(AssetSource(audioPath));
                print(animals[dogruCevapIndex]);
                print(dogruCevapIndex);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onAnswered(bool isCorrect) async {
    if (!isCorrect) {
      String audioPath = ("wrong.mp3");
      await player.play(AssetSource(audioPath));
    } else {
      String audioPath = ("true.mp3");
      await player.play(AssetSource(audioPath));
    }
  }
}

class SoruSiklari extends StatefulWidget {
  const SoruSiklari({
    super.key,
    required this.animals,
    required this.index,
    required this.isDogruCevap,
    required this.onAnswered,
  });

  final List<String> animals;
  final int index;
  final bool isDogruCevap;
  final Function(bool) onAnswered; // Yanıtı belirtmek için bir fonksiyon

  @override
  State<SoruSiklari> createState() => _SoruSiklariState();
}

class _SoruSiklariState extends State<SoruSiklari> {
  late Color backgroundColor;

  @override
  void initState() {
    super.initState();
    backgroundColor = Colors.blue; // Varsayılan olarak mavi renk atayalım
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          // Tıklama durumuna göre arka plan rengini güncelle
          backgroundColor = widget.isDogruCevap ? Colors.green : Colors.red;
          if (widget.isDogruCevap) {
            _restartPage();
          } // Sayfayı yeniden başlat
        });
        widget.onAnswered(widget.isDogruCevap); // Yanıtı bildir
      },
      child: Container(
        color: backgroundColor,
        child: Image.asset("assets/${widget.animals[widget.index]}.png"),
      ),
    );
  }

  void _restartPage() {
    Future.delayed(const Duration(milliseconds: 600), () {
      // 500 milisaniye sonra sayfayı yeniden başlat
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const InstrumentPageTest(),
        ),
      );
    });
  }
}
