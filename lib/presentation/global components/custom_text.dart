import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontStyle,
    this.fontWeight,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.isLineThrough = false,
  });
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? isLineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        decoration: isLineThrough ?? false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        decorationColor: isLineThrough ?? false ? AppColors.red : null,
      ),
    );
  }
}
