import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:listen_kids_what_is_that/custom_colors.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key});

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
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
    Colors.cyan,
    Colors.grey,
    Colors.lightBlue,
    Colors.lightGreen,
  ];
  final List<String> animals = [
    "DOG",
    "LION",
    "CROW",
    "ELEPHANT",
    "CHICKEN",
    "CAT",
    "HORSE",
    "DOLPHIN",
    "WOLF",
    "DUCK",
    "BIRD",
    "BEE",
    "COW",
    "SHEEP",
    "SNAKE",
    "MONKEY"
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
        itemCount: 16, // Toplam öğe sayısı
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              String audioPath =
                  ("sounds/animals/${animals[index % animals.length]}.mp3");
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
