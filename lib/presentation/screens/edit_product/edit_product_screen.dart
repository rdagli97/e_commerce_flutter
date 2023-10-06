import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/models/product_model.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({
    super.key,
    required this.productsModel,
  });
  final ProductsModel productsModel;

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
