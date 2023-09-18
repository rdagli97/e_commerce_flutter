import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_sales_tile.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';

class MySalesScreen extends StatelessWidget {
  const MySalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'My sales'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  CustomSalestile(),
                  CustomSalestile(),
                  CustomSalestile(),
                  CustomSalestile(),
                  CustomSalestile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
