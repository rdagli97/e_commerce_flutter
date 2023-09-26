import 'package:flutter/material.dart';

class NavigateSkills {
  pushTo(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<void> pushReplacementTo(BuildContext context, Widget widget) async {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
