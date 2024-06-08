import 'package:flutter/material.dart';
import 'package:listen_kids_what_is_that/pages/categoryPage/category_page.dart';
import 'package:listen_kids_what_is_that/pages/testPage/test_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /* late final AudioPlayer player;
  late final VideoPlayerController _backController; */

  /* @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    _backController = VideoPlayerController.asset("assets/mainback.mp4")
      ..initialize().then((_) {
        setState(() {});
        _backController.play();
        _backController.setLooping(true);
      });
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
    _backController.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 1),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TestPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 2, color: Colors.black),
            ),
          ),
          child: SizedBox(
            width: 120,
            height: 60,
            child: Image.asset(
              "assets/solo.png",
              height: 60,
              width: 120,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Image.asset(
            "assets/mainArka.png",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: SizedBox(
              width: 150,
              height: 150,
              child: FloatingActionButton.large(
                backgroundColor: Colors.transparent,
                shape: const CircleBorder(
                  side: BorderSide(width: 2, color: Colors.transparent),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryPage(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
