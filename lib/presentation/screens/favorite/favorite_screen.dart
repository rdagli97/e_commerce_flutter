import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';

import '../../global components/custom_list_tile.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'My Favourites'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.5,
                children: const [
                  CustomListTile(),
                  CustomListTile(),
                  CustomListTile(),
                  CustomListTile(),
                  CustomListTile(),
                  CustomListTile(),
                  CustomListTile(),
                  CustomListTile(),
                  CustomListTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
