import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class ContainerImage extends StatelessWidget {
  const ContainerImage({
    super.key,
    this.fileImage,
  });
  final File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.inactiveColor,
        ),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(fileImage!),
        ),
      ),
    );
  }
}
