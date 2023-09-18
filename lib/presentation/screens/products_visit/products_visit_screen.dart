import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/products_visit/visit_product_tile.dart';

class ProductsVisitScreen extends StatelessWidget {
  const ProductsVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Products'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  VisitProductTile(),
                  VisitProductTile(),
                  VisitProductTile(),
                  VisitProductTile(),
                  VisitProductTile(),
                  VisitProductTile(),
                  VisitProductTile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
