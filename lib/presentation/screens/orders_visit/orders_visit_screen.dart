import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/data/models/buyed_products.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/orders_visit/visit_order_tile.dart';
import 'package:provider/provider.dart';

class OrdersVisitScreen extends StatefulWidget {
  const OrdersVisitScreen({super.key});

  @override
  State<OrdersVisitScreen> createState() => _OrdersVisitScreenState();
}

class _OrdersVisitScreenState extends State<OrdersVisitScreen> {
  @override
  Widget build(BuildContext context) {
    final userRead = context.read<UserController>().user;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "${userRead?.username}'s orders"),
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
                  final BuyedProductsModel? order =
                      userRead?.buyedProducts![index];
                  return VisitOrderTile(
                    title: '${order?.title}',
                    description: '${order?.description}',
                    imageUrl: '${order?.image}',
                    piece: order?.piece ?? 1,
                    price: order?.price ?? 0,
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
