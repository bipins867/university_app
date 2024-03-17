import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:university_app/Components/EventAndNotice/user_event_and_notice_page.dart';
import 'package:university_app/Components/UserDashboard/FacultyList/faculty_list_page.dart';
import 'package:university_app/Components/UserDashboard/PreviousYearQuestions/previous_year_questions_page.dart';
import 'package:university_app/Components/UserDashboard/Student/controller_student.dart';
import 'package:university_app/Components/UserDashboard/StudyMaterial/study_material_page.dart';
import 'package:university_app/Components/UserDashboard/UserProfile/user_profile_page.dart';
import 'package:university_app/Components/global_ui_helper.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  Map userInfo = {"name": ""};

  @override
  void initState() {
    getUserProfileInfo().then(
      (value) {
        setState(() {
          userInfo = value['userInfo'];
        });
      },
    ).onError((error, stackTrace) {
      GlobalUi.createErrorAlertBox(context, 'Error', error.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        ListTile(
          title: Text("Welcome, ${userInfo['name']}"),
        ),
        const SizedBox(height: 20.0),
        _buildDashboardItem(
          context,
          'View Profile',
          Icons.person,
          () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserProfilePage(
                userInfo: userInfo,
              ),
            ));
          },
        ),
        _buildDashboardItem(
          context,
          'Event & Notice Section',
          Icons.event,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const EventAndNewsPage(),
              ),
            );
          },
        ),
        _buildDashboardItem(
          context,
          'Study Materials',
          Icons.book,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const StudyMaterialPage(),
              ),
            );
          },
        ),
        _buildDashboardItem(
          context,
          'Previous Year Questions',
          Icons.question_answer,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PreviousYearQuestionPage(),
              ),
            );
          },
        ),
        _buildDashboardItem(
          context,
          'Faculty List',
          Icons.people,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FacultyListPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDashboardItem(BuildContext context, String title, IconData icon,
      VoidCallback onPressed) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onPressed,
      ),
    );
  }
}
