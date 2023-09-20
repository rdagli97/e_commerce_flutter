import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/presentation/screens/create_new_product/container_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CreateNewProductScreen extends StatefulWidget {
  const CreateNewProductScreen({super.key});

  @override
  State<CreateNewProductScreen> createState() => _CreateNewProductScreenState();
}

class _CreateNewProductScreenState extends State<CreateNewProductScreen> {
  int activeIndex = 0;
  final CarouselController controller = CarouselController();
  final List<String> urlImages = [
    "https://i.pinimg.com/1200x/a5/af/29/a5af297cc589e13706929afb0015aabd.jpg",
    "https://i.pinimg.com/originals/db/12/fe/db12fea16a6836ac1a7580921983fa06.jpg",
    "https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2F0Y2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1587925358603-c2eea5305bbc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d3Jpc3R3YXRjaHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    "https://c4.wallpaperflare.com/wallpaper/29/520/1004/breitling-swiss-luxury-watches-swiss-wrist-watches-luxury-analog-watch-breitling-hd-wallpaper-preview.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Create new product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // image slider
              CarouselSlider.builder(
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.3,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  onPageChanged: (index, _) =>
                      setState(() => activeIndex = index),
                ),
              ),
              const SizedBox(height: 12),
              // smooth page indicator
              buildIndicator(),
              AddSpace().vertical(MediaQuery.of(context).size.height * 0.02),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // add photo
                  },
                  child: const CustomText(
                    text: 'Add photo',
                    color: AppColors.blue,
                  ),
                ),
              ),
              AddSpace().vertical(MediaQuery.of(context).size.height * 0.02),
              // Title textfield
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: 'Title',
              ),
              AddSpace().vertical(MediaQuery.of(context).size.height * 0.03),
              // Description textfield
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: 'Description',
                maxLines: 5,
              ),
              AddSpace().vertical(MediaQuery.of(context).size.height * 0.03),
              // Price textfield
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: 'Price',
                keyboardType: TextInputType.number,
                suffixIconData: Icons.euro,
              ),
              AddSpace().vertical(MediaQuery.of(context).size.height * 0.03),
              // Publish the product
              CustomButton(
                color: AppColors.primaryColor,
                onTap: () {
                  // create new product
                },
                child: const CustomText(
                  text: 'Publish',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
          dotWidth: 15,
          activeDotColor: AppColors.primaryColor,
        ),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) {
  return ContainerImage(
    networkImage: urlImage,
  );
}
