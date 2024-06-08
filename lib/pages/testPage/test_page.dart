import 'package:flutter/material.dart';
import 'package:listen_kids_what_is_that/pages/categoryPage/widgets/widgets.dart';
import 'package:listen_kids_what_is_that/pages/testPage/animal_page_test.dart';
import 'package:listen_kids_what_is_that/pages/testPage/cars_page_test.dart';
import 'package:listen_kids_what_is_that/pages/testPage/instrument_page_test.dart';
import 'package:listen_kids_what_is_that/pages/testPage/nature_page_test.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: selectCategory(
                        assetName: "animalback.png",
                        page: AnimalPageTest(),
                        color: Colors.black,
                      ),
                    ),
                    DividerContainer(
                      width: 4,
                    ),
                    Expanded(
                      child: selectCategory(
                        assetName: "instrument.png",
                        page: InstrumentPageTest(),
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              DividerContainer(
                height: 4,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: selectCategory(
                        assetName: "carsback.png",
                        page: CarsPageTest(),
                        color: Colors.black,
                      ),
                    ),
                    DividerContainer(
                      width: 4,
                    ),
                    Expanded(
                      child: selectCategory(
                        assetName: "natureback.png",
                        page: NaturePageTest(),
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: FloatingActionButton.large(
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(Icons.home_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
