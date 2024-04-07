import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:university_app/Components/global_controller.dart';

class BodyImageSlider extends StatefulWidget {
  const BodyImageSlider({super.key});

  @override
  State<BodyImageSlider> createState() => _BodyImageSliderState();
}

class _BodyImageSliderState extends State<BodyImageSlider> {
  List imageList = [];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  void initState() {
    GlobalController.getRequest('home/get/homeImages').then(
      (info) {
        setState(() {
          imageList = info['homeImages'];
        });
      },
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageList.map((item) {
        return Image.network(item['imageUrl']);
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
