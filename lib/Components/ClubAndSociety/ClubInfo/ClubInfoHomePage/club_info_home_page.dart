import 'package:flutter/material.dart';

import '../../../global_ui_helper.dart';

class ClubInfoHomePage extends StatelessWidget {
  final Map clubInfo;
  const ClubInfoHomePage({super.key, required this.clubInfo});

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage =
        GlobalUi.getImage(clubInfo['profilePic'], Icons.school);
    final club = clubInfo;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Club & Societes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                club['title'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                club['subTitle'],
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            // club Image
            Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: backgroundImage),
            ),
            // About
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    club['about'],
                    style: const TextStyle(
                      fontSize: 16,
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
}
