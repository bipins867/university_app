import 'package:flutter/material.dart';
import 'package:university_app/Components/Home/Body/CrouselImages/body_image_slider.dart';
import 'package:university_app/Components/Home/Body/HeaderImages/header_images_page.dart';
import 'package:university_app/Components/Home/Body/LeaderList/leader_list_page.dart';
import 'package:university_app/Components/Home/Body/Welcome/welcome_page.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderImagesPage(),
          BodyImageSlider(),
          LeaderList(),
          WelcomePage()
        ],
      ),
    );
  }
}
