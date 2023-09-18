import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/resources/consts/assets_strings.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    super.key,
    this.height,
    this.width,
  });
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: width ?? 25,
      height: height ?? 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppAssets.watch1Asset),
        ),
      ),
    );
  }
}
