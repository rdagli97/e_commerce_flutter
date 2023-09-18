import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_order_tile.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'My Orders'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  CustomOrderTile(
                    statusText: '• On the way',
                    statusColor: AppColors.yellow,
                  ),
                  CustomOrderTile(
                    statusText: '• Failed',
                    statusColor: AppColors.red,
                  ),
                  CustomOrderTile(),
                  CustomOrderTile(),
                  CustomOrderTile(),
                  CustomOrderTile(),
                  CustomOrderTile(),
                  CustomOrderTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
