import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/product_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/create_new_product/container_image.dart';
import 'package:flutter_e_commerce_app/resources/utils/handle_error.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../resources/style/colors.dart';
import '../../../resources/utils/add_space.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({super.key});

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  File? _imageFile;
  final _picker = ImagePicker();
  int activeIndex = 0;
  final CarouselController controller = CarouselController();

  void addPhoto() {
    context.read<ProductController>().addPhotoToList(_imageFile);
    setState(() {
      _imageFile = null;
    });
  }

  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {
      if (!mounted) return;
      HandleError().showErrorMessage(context, 'No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    final productWatch = context.watch<ProductController>();
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Add Photo'),
        centerTitle: true,
      ),
      body: _imageFile == null
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
              child: Column(
                children: [
                  productWatch.productImages.isEmpty
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/products/default_image.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      :
                      // image slider
                      CarouselSlider.builder(
                          itemCount: productWatch.productImages.length,
                          itemBuilder: (context, index, realIndex) {
                            final fileImage = productWatch.productImages[index];
                            return buildImage(fileImage, index);
                          },
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.3,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            onPageChanged: (index, _) =>
                                setState(() => activeIndex = index),
                          ),
                        ),
                  // smooth page indicator
                  AddSpace().vertical(10),
                  buildIndicator(),
                  AddSpace()
                      .vertical(MediaQuery.of(context).size.height * 0.02),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () async {
                        await _getImage();
                      },
                      child: const CustomText(
                        text: 'Add photo',
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                  AddSpace()
                      .vertical(MediaQuery.of(context).size.height * 0.02),
                  // publish photos
                  CustomButton(
                    color: AppColors.primaryColor,
                    onTap: () async {
                      // create product images with for in
                      for (var image in productWatch.productImages) {
                        await context
                            .read<ProductController>()
                            .createProductImage(
                              context: context,
                              mounted: mounted,
                              image: image,
                            );
                      }
                    },
                    child: const CustomText(
                      text: 'Publish with photos',
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(
                          _imageFile!,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // cancel button
                      IconButton(
                        icon: const Icon(Icons.close),
                        color: AppColors.red,
                        onPressed: () {
                          setState(() {
                            _imageFile = null;
                          });
                        },
                      ),
                      // okay button
                      IconButton(
                        icon: const Icon(Icons.check),
                        color: AppColors.primaryColor,
                        onPressed: () {
                          // add photo to list
                          setState(() {
                            addPhoto();
                          });
                        },
                      ),
                    ],
                  ),
                ],
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
        count: context.watch<ProductController>().productImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(File? fileImage, int index) {
  return ContainerImage(
    fileImage: fileImage,
  );
}
