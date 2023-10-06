import 'package:flutter/material.dart';

class DiscountController extends ChangeNotifier {
  int _discountValue = 0;
  int get discountValue => _discountValue;

  double _newPrice = 0;
  double get newPrice => _newPrice;

  double _changePrice = 0;
  double get changePrice => _changePrice;

  void changeDiscountValue(TextEditingController discountController) {
    _discountValue = int.parse(discountController.text);
    notifyListeners();
  }

  void calculateNewPrice(double oldPrice) {
    oldPrice = (oldPrice - (oldPrice * _discountValue) / 100);
    _newPrice = oldPrice;
    notifyListeners();
  }

  void changingPrice(TextEditingController changePrice) {
    _changePrice = double.parse(changePrice.text);
    notifyListeners();
  }

  void resetChangePrice() async {
    _changePrice = 0;
    notifyListeners();
  }
}
