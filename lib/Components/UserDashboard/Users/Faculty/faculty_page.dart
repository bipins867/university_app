import 'package:flutter/material.dart';
import 'package:university_app/Components/EventAndNotice/user_event_and_notice_page.dart';
import 'package:university_app/Components/Department/department_page.dart';
import 'package:university_app/Components/UserDashboard/Users/Faculty/faculty_profile_page.dart';

import 'package:university_app/Components/UserDashboard/Users/controller_user.dart';
import 'package:university_app/Components/global_ui_helper.dart';

class FacultyDashboard extends StatefulWidget {
  const FacultyDashboard({super.key});

  @override
  State<FacultyDashboard> createState() => _FacultyDashboardState();
}

class _FacultyDashboardState extends State<FacultyDashboard> {
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
          title: Text("Welcome, Dr. ${userInfo['name']}"),
        ),
        const SizedBox(height: 20.0),
        _buildDashboardItem(
          context,
          'View Profile',
          Icons.person,
          () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FacultyProfilePage(
                userInfo: userInfo,
              ),
            ));
          },
        ),
        _buildDashboardItem(
          context,
          'Events and Notifications',
          Icons.notifications,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const EventAndNewsPage(
                  forWhom: 2222,
                ),
              ),
            );
          },
        ),
        _buildDashboardItem(
          context,
          'Department',
          Icons.apartment,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const DepartmentListPage(),
              ),
            );
          },
        ),
        _buildDashboardItem(
          context,
          'Student Attendance',
          Icons.accessibility,
          () {
            // Navigate to student attendance screen
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
