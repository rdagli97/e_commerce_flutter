import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class ContainerImage extends StatelessWidget {
  const ContainerImage({
    super.key,
    this.networkImage,
  });
  final String? networkImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // select image
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.inactiveColor,
          ),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(networkImage!),
          ),
        ),
      ),
    );
  }
}
