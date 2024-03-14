import 'package:flutter/material.dart';

class HeaderImagesPage extends StatelessWidget {
  const HeaderImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/Home/logo-banner.jpg'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Home/Azadi-Ka-Amrit-Mahotsav-Logo.png',
              height: 80,
            ),
            Image.asset(
              'assets/Home/G20_India_Logo.png',
              height: 80,
            ),
          ],
        ),
      ],
    );
  }
}
