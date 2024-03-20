import 'package:flutter/material.dart';

class DepartmentInfoHomePage extends StatelessWidget {
  final Map departmentInfo;
  const DepartmentInfoHomePage({super.key, required this.departmentInfo});

  @override
  Widget build(BuildContext context) {
    final department = departmentInfo;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Department'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                department['title'],
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
                department['subTitle'],
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            // Department Image
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
                child: Image.asset(
                  'assets/Home/ImageSlide/6.jpg',
                  fit: BoxFit.cover,
                ),
              ),
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
                    department['about'],
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
