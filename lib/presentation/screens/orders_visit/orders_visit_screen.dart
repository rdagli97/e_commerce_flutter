import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/orders_visit/visit_order_tile.dart';

class OrdersVisitScreen extends StatelessWidget {
  const OrdersVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Orders'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  VisitOrderTile(),
                  VisitOrderTile(),
                  VisitOrderTile(),
                  VisitOrderTile(),
                  VisitOrderTile(),
                  VisitOrderTile(),
                  VisitOrderTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
