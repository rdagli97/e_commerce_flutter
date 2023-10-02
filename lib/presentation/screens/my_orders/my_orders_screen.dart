import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/data/models/buyed_products.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_order_tile.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final userRead = context.read<UserController>().user;
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
              child: ListView.builder(
                itemCount: userRead?.buyedProducts?.length ?? 0,
                itemBuilder: (context, index) {
                  final BuyedProductsModel? orderedProduct =
                      userRead?.buyedProducts![index];
                  return CustomOrderTile(
                    title: orderedProduct?.title ?? '',
                    description: orderedProduct?.description ?? '',
                    imageUrl: orderedProduct?.image ?? '',
                    piece: orderedProduct?.piece ?? 1,
                    price: orderedProduct?.price ?? 0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
