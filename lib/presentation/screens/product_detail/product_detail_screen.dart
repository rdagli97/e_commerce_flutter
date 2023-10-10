import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/models/product_model.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_icon_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_star_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/product_detail/detail_image_container.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/presentation/screens/product_detail/image_container_product.dart';
import 'package:flutter_e_commerce_app/presentation/screens/product_detail/piece_calculator_container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    this.productsModel,
  });
  final ProductsModel? productsModel;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String size = 'M';
  int piece = 0;
  int activeIndex = 0;
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Slider
            Stack(
              children: [
                widget.productsModel?.image !=
                        'https://climate.onep.go.th/wp-content/uploads/2020/01/default-image.jpg'
                    ? CarouselSlider.builder(
                        itemCount:
                            widget.productsModel?.productImages?.length ?? 0,
                        itemBuilder: (context, index, realIndex) {
                          final imageList =
                              widget.productsModel?.productImages![index];
                          return buildImage(imageList?.image, index);
                        },
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.5,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index),
                        ),
                      )
                    : DetailImageContainer(
                        imageUrl: widget.productsModel?.image ?? ''),
                Positioned(
                  bottom: 10,
                  left: MediaQuery.of(context).size.width * 0.4,
                  child: widget.productsModel?.productImages?.length != 1
                      ? buildIndicator()
                      : const SizedBox(),
                ),
                Positioned(
                  left: 30,
                  top: 30,
                  child: CustomIconButton(
                    color: AppColors.inactiveColor,
                    iconData: Icons.arrow_back,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  // Title
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: '${widget.productsModel?.title}',
                      fontSize: AppFontSizes.subTitle16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      // Star rating
                      CustomStarContainer(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.2,
                        iconSize: 24,
                        rateSize: 16,
                        bgColor: AppColors.white,
                        rate: 4.9,
                      ),
                      // Comment length
                      CustomText(
                        text: '${widget.productsModel?.comments?.length}',
                        color: AppColors.grey,
                        fontSize: AppFontSizes.shopTitle12,
                      ),
                      AddSpace()
                          .horizontal(MediaQuery.of(context).size.width * 0.01),
                      // Reviews
                      const CustomText(
                        text: 'Reviews',
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSizes.shopTitle12,
                      ),
                    ],
                  ),
                  // Select size
                  // // S M L XL / 30 / 31 .. 45
                  Align(
                    alignment: Alignment.centerLeft,
                    child: PopupMenuButton(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [
                            CustomText(
                              text: 'Select size',
                            ),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 's',
                          child: CustomText(
                            text: 'S',
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'm',
                          child: CustomText(
                            text: 'M',
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'l',
                          child: CustomText(
                            text: 'L',
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'xl',
                          child: CustomText(
                            text: 'XL',
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'xxl',
                          child: CustomText(
                            text: 'XXL',
                          ),
                        ),
                        const PopupMenuItem(
                          value: '3xl',
                          child: CustomText(
                            text: '3XL',
                          ),
                        ),
                      ],
                      onSelected: (value) {
                        switch (value) {
                          case 's':
                            setState(() {
                              size = 'S';
                            });
                            break;
                          case 'm':
                            setState(() {
                              size = 'M';
                            });
                            break;
                          case 'l':
                            setState(() {
                              size = 'L';
                            });
                            break;
                          case 'xl':
                            setState(() {
                              size = 'XL';
                            });
                            break;
                          case 'xxl':
                            setState(() {
                              size = 'XXL';
                            });
                            break;
                          case '3xl':
                            setState(() {
                              size = '3XL';
                            });
                            break;
                          default:
                            size = 'M';
                            break;
                        }
                      },
                    ),
                  ),
                  AddSpace()
                      .vertical(MediaQuery.of(context).size.height * 0.01),
                  // Size
                  Row(
                    children: [
                      // Size :
                      const CustomText(
                        text: 'Size : ',
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CustomText(
                          text: size,
                        ),
                      ),
                    ],
                  ),
                  AddSpace()
                      .vertical(MediaQuery.of(context).size.height * 0.01),
                  Row(
                    children: [
                      PieceCalculatorContainer(
                        pieceText: '$piece',
                        incrementTAP: () {
                          setState(() {
                            piece++;
                          });
                        },
                        decrementTAP: () {
                          if (piece != 0) {
                            setState(() {
                              piece--;
                            });
                          }
                        },
                      ),
                      // Add to card button
                      const Spacer(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: CustomButton(
                          color: AppColors.primaryColor,
                          onTap: () {},
                          child: const CustomText(
                            text: 'Add to card',
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  AddSpace()
                      .vertical(MediaQuery.of(context).size.height * 0.05),
                  // Subtitle
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: '${widget.productsModel?.description}',
                      fontSize: AppFontSizes.subTitle16,
                      maxLines: 20,
                    ),
                  ),
                ],
              ),
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
        count: widget.productsModel?.productImages?.length ?? 0,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String? urlImage, int index) {
  return ImageContainerProduct(
    imageUrl: urlImage,
  );
}
