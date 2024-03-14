import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/Alumini/alumini_page.dart';
import 'package:university_app/Components/UserDashboard/Faculty/faculty_page.dart';
import 'package:university_app/Components/UserDashboard/Student/student_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  final Map obj = const {
    'student': {'title': "Student Dashboard", 'body': StudentDashboard()},
    'faculty': {'title': "Faculty Dashboard", 'body': FacultyDashboard()},
    'alumini': {'title': "Alumni Dashboard", 'body': AlumniDashboard()},
  };
  @override
  Widget build(BuildContext context) {
    Map currentObj = obj['student'];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentObj['title']),
      ),
      //drawer: const HomeDrawer(),
      body: currentObj['body'],
    );
  }
}
