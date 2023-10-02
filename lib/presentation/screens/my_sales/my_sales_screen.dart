import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/data/models/saled_products.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_sales_tile.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:provider/provider.dart';

class MySalesScreen extends StatefulWidget {
  const MySalesScreen({super.key});

  @override
  State<MySalesScreen> createState() => _MySalesScreenState();
}

class _MySalesScreenState extends State<MySalesScreen> {
  @override
  Widget build(BuildContext context) {
    final userRead = context.read<UserController>().user;
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
              child: ListView.builder(
                itemCount: userRead?.saledProducts?.length ?? 0,
                itemBuilder: (context, index) {
                  final SaledProductsModel? saledProduct =
                      userRead?.saledProducts![index];
                  return CustomSalestile(
                    title: '${saledProduct?.title}',
                    description: '${saledProduct?.description}',
                    piece: saledProduct?.piece ?? 1,
                    price: saledProduct?.price ?? 0,
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
