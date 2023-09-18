import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final RxInt _activeIndex = RxInt(0);

  final CarouselController controller = CarouselController();

  final RxList<String> _urlImages = RxList.empty();

  @override
  void onInit() {
    getUrlImages();
    super.onInit();
  }

  void getUrlImages() {
    _urlImages.value = [
      "https://i.pinimg.com/1200x/a5/af/29/a5af297cc589e13706929afb0015aabd.jpg",
      "https://i.pinimg.com/originals/db/12/fe/db12fea16a6836ac1a7580921983fa06.jpg",
      "https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2F0Y2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
      "https://images.unsplash.com/photo-1587925358603-c2eea5305bbc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d3Jpc3R3YXRjaHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
      "https://c4.wallpaperflare.com/wallpaper/29/520/1004/breitling-swiss-luxury-watches-swiss-wrist-watches-luxury-analog-watch-breitling-hd-wallpaper-preview.jpg",
    ];
    _urlImages.refresh();
    update();
  }

  void createTAP() {}

  onPageChanged(int index, CarouselPageChangedReason _) {
    _activeIndex.value = index;
    update();
  }
}
