import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/data/models/product_model.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/products_visit/visit_product_tile.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';
import 'package:provider/provider.dart';

class ProductsVisitScreen extends StatefulWidget {
  const ProductsVisitScreen({super.key});

  @override
  State<ProductsVisitScreen> createState() => _ProductsVisitScreenState();
}

class _ProductsVisitScreenState extends State<ProductsVisitScreen> {
  @override
  Widget build(BuildContext context) {
    final userRead = context.read<UserController>().user;
    final userWatch = context.watch<UserController>().user;
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
              child: ListView.builder(
                itemCount: userRead?.products?.length ?? 0,
                itemBuilder: (context, index) {
                  ProductsModel? product = userWatch?.products![index];
                  return VisitProductTile(
                    title: product?.title ?? 'title',
                    description: product?.description ?? 'description',
                    rating: 4.9,
                    price: product?.price ?? 0,
                    imageUrl: product?.image ?? '',
                    onTap: () {
                      NavigateSkills().pushTo(
                        context,
                        ProductDetailScreen(productsModel: product),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
