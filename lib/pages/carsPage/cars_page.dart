import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:listen_kids_what_is_that/custom_colors.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
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
  final List<String> animals = [
    "FIRECAR",
    "HELICOPTER",
    "AMBULANCE",
    "POLICE",
    "TRAIN",
    "RACECAR",
    "MOTORBIKE",
    "TRACTOR",
    "SHIP",
    "PLANE",
    "TRUCK",
    "BIKE",
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
        itemCount: 12, // Toplam öğe sayısı
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              String audioPath =
                  ("sounds/cars/${animals[index % animals.length]}.mp3");
              await player.play(AssetSource(audioPath));
            },
            child: Container(
                color: colors[
                    index % colors.length], // Renkleri listeye göre atama
                child:
                    Image.asset("assets/${animals[index % animals.length]}.png")
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
