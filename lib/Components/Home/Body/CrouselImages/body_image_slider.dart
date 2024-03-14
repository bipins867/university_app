import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BodyImageSlider extends StatefulWidget {
  const BodyImageSlider({super.key});

  @override
  State<BodyImageSlider> createState() => _BodyImageSliderState();
}

class _BodyImageSliderState extends State<BodyImageSlider> {
  List imageList = [
    {'id': 1, 'image_path': 'assets/Home/ImageSlide/1.jpg'},
    {'id': 2, 'image_path': 'assets/Home/ImageSlide/2.jpg'},
    {'id': 3, 'image_path': 'assets/Home/ImageSlide/3.jpg'},
    {'id': 4, 'image_path': 'assets/Home/ImageSlide/4.jpg'},
    {'id': 5, 'image_path': 'assets/Home/ImageSlide/5.jpg'},
    {'id': 6, 'image_path': 'assets/Home/ImageSlide/6.jpg'},
    {'id': 7, 'image_path': 'assets/Home/ImageSlide/7.jpg'},
    {'id': 8, 'image_path': 'assets/Home/ImageSlide/8.jpg'},
    {'id': 9, 'image_path': 'assets/Home/ImageSlide/9.jpg'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageList.map((item) {
        return Image.asset(item['image_path']);
      }).toList(),
      carouselController: carouselController,
      options: CarouselOptions(
        scrollPhysics: const BouncingScrollPhysics(),
        autoPlay: true,
        aspectRatio: 2,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
