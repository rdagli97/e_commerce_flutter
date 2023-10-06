import 'package:flutter/material.dart';

Widget unFocus({required BuildContext context, required Widget child}) {
  return GestureDetector(
    onTap: () {
      FocusScope.of(context).unfocus();
    },
    child: child,
  );
}
