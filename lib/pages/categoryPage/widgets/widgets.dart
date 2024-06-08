import 'package:flutter/material.dart';

class selectCategory extends StatelessWidget {
  final Widget page;
  final Color color;

  final String? assetName;
  const selectCategory({
    super.key,
    required this.page,
    required this.color,
    this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ));
        print("pressed");
      },
      child: Container(
        decoration: BoxDecoration(color: color),
        width: double.infinity,
        height: double.infinity,
        child: assetName != null
            ? Image.asset(
                "assets/${assetName!}",
                fit: BoxFit.fill,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class DividerContainer extends StatelessWidget {
  final double? width;
  final double? height;
  const DividerContainer({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      color: Colors.white,
    );
  }
}
