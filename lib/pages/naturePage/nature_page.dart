import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:listen_kids_what_is_that/custom_colors.dart';

class NaturePage extends StatefulWidget {
  const NaturePage({super.key});

  @override
  State<NaturePage> createState() => _NaturePageState();
}

class _NaturePageState extends State<NaturePage> {
  final player = AudioPlayer();
  // Renklerin bir listesi
  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.amber,
    Colors.pink,
    Colors.orange,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.brown,
  ];
  final List<String> nature = [
    "WIND",
    "RAIN",
    "THUNDERBOLT",
    "WAVE",
    "FISSLE",
    "WATERFALL",
    "FIRE",
    "SNOW",
  ];
  @override
  void dispose() {
    player.dispose(); // AudioPlayer'ı temizle
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: CustomColors.white,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.close),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Her satırda 4 widget
          childAspectRatio: 1, // Yükseklik ve genişliğin oranı 1:1
        ),
        itemCount: 8, // Toplam öğe sayısı
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              String audioPath =
                  ("sounds/nature/${nature[index % nature.length]}.mp3");
              await player.play(AssetSource(audioPath));
            },
            child: Container(
                color: colors[
                    index % colors.length], // Renkleri listeye göre atama
                child:
                    Image.asset("assets/${nature[index % nature.length]}.png")
                /* Center(
                child: Text(animals[index % animals.length]),
              ), */
                ),
          );
        },
      ),
    );
  }
}
