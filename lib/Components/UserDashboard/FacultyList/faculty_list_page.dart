import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:university_app/Components/UserDashboard/Users/Faculty/faculty_profile_page.dart';
import 'package:university_app/Components/global_controller.dart';

class FacultyListPage extends StatefulWidget {
  const FacultyListPage({super.key});

  @override
  State<FacultyListPage> createState() => _FacultyListPageState();
}

class _FacultyListPageState extends State<FacultyListPage> {
  List facultyList = [];

  @override
  void initState() {
    GlobalController.getRequest('user/get/allFaculty').then(
      (faculties) {
        setState(() {
          facultyList = faculties['faculties'];
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty List'),
      ),
      body: ListView.builder(
        itemCount: facultyList.length,
        itemBuilder: (context, index) {
          final faculty = facultyList[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FacultyProfilePage(
                    userInfo: faculty,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      faculty['name'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(faculty['designation'] ?? ''),
                    Text(faculty['areaOfSpecialization'] ?? ''),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
