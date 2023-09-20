import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_category_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_list_tile.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

import '../../global components/custom_text.dart';
import '../../../resources/style/colors.dart';
import '../../../resources/style/font_sizes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Column(
          children: [
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: 'Search in here',
              borderEnabled: false,
              suffixIconData: Icons.search,
            ),
            Row(
              children: [
                // Shope by category
                const CustomText(
                  text: 'Shope by category',
                  fontSize: AppFontSizes.subTitle16,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                // view all text button
                TextButton(
                  onPressed: () {},
                  child: const CustomText(
                    text: 'View all',
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            // List view category
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CustomCategoryContainer(
                    title: 'Popular',
                  ),
                  CustomCategoryContainer(
                    title: 'Men',
                  ),
                  CustomCategoryContainer(
                    title: 'Women',
                  ),
                  CustomCategoryContainer(
                    title: 'Kids',
                  ),
                  CustomCategoryContainer(
                    title: 'Shoes',
                  ),
                ],
              ),
            ),
            AddSpace().vertical(10),
            Row(
              children: [
                // Shope by category
                const CustomText(
                  text: 'Trends',
                  fontSize: AppFontSizes.subTitle16,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                // view all text button
                TextButton(
                  onPressed: () {},
                  child: const CustomText(
                    text: 'View all',
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            // List view category
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.7,
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
