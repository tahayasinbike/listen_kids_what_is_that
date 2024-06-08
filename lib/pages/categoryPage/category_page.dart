import 'package:flutter/material.dart';
import 'package:listen_kids_what_is_that/pages/animalPage/animal_page.dart';
import 'package:listen_kids_what_is_that/pages/carsPage/cars_page.dart';
import 'package:listen_kids_what_is_that/pages/categoryPage/widgets/widgets.dart';
import 'package:listen_kids_what_is_that/pages/instrumentPage/instrument_page.dart';
import 'package:listen_kids_what_is_that/pages/naturePage/nature_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
                        page: AnimalPage(),
                        color: Colors.yellow,
                      ),
                    ),
                    DividerContainer(
                      width: 4,
                    ),
                    Expanded(
                      child: selectCategory(
                        assetName: "instrument.png",
                        page: InstrumentPage(),
                        color: Colors.blue,
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
                        page: CarsPage(),
                        color: Colors.orange,
                      ),
                    ),
                    DividerContainer(
                      width: 4,
                    ),
                    Expanded(
                      child: selectCategory(
                        assetName: "natureback.png",
                        page: NaturePage(),
                        color: Colors.red,
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
