import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_app/Components/UserDashboard/Users/Alumni/alumni_page.dart';
import 'package:university_app/Components/UserDashboard/Users/Faculty/faculty_page.dart';
import 'package:university_app/Components/UserDashboard/Users/Student/student_page.dart';
import 'package:university_app/Components/global_controller.dart';
import 'package:university_app/Store/global_state_management.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  final Map obj = const {
    'student': {'title': "Student Dashboard", 'body': StudentDashboard()},
    'faculty': {'title': "Faculty Dashboard", 'body': FacultyDashboard()},
    'alumni': {'title': "Alumni Dashboard", 'body': AlumniDashboard()},
  };
  @override
  Widget build(BuildContext context) {
    final globalStateHandler = Provider.of<GlobalStateHandler>(context);

    Map currentObj = obj[globalStateHandler.userType];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentObj['title']),
        actions: [
          TextButton(
            onPressed: () {
              GlobalController.logOut(context);
            },
            child: const Text(
              "LogOut",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
      //drawer: const HomeDrawer(),
      body: currentObj['body'],
    );
  }
}
