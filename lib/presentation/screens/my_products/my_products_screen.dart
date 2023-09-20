import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_products_tile.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class MyProductsScreen extends StatefulWidget {
  const MyProductsScreen({super.key});

  @override
  State<MyProductsScreen> createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen> {
  bool showActiveProducts = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'My Products'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: PopupMenuButton(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    CustomText(
                      text: 'Active products',
                      fontWeight: FontWeight.bold,
                    ),
                    Icon(Icons.arrow_drop_down_rounded),
                  ],
                ),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'active',
                    child: CustomText(
                      text: 'Active products',
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'inactive',
                    child: CustomText(
                      text: 'Inactive products',
                    ),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'inactive') {
                    setState(() {
                      showActiveProducts = false;
                    });
                  } else {
                    setState(() {
                      showActiveProducts = true;
                    });
                  }
                },
              ),
            ),
            AddSpace().vertical(MediaQuery.of(context).size.height * 0.05),
            showActiveProducts
                ? Expanded(
                    child: ListView(
                      children: [
                        CustomProductTile(
                          onSelected: (value) {},
                        ),
                        CustomProductTile(
                          onSelected: (value) {},
                        ),
                        CustomProductTile(
                          onSelected: (value) {},
                        ),
                        CustomProductTile(
                          onSelected: (value) {},
                        ),
                        CustomProductTile(
                          onSelected: (value) {},
                        ),
                        CustomProductTile(
                          onSelected: (value) {},
                        ),
                        CustomProductTile(
                          onSelected: (value) {},
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView(
                      children: [
                        CustomProductTile(
                          statusColor: AppColors.grey,
                          statusText: '• Inactive',
                          onSelected: (value) {},
                        ),
                        CustomProductTile(
                          statusColor: AppColors.grey,
                          statusText: '• Inactive',
                          onSelected: (value) {},
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
