import 'package:flutter/material.dart';
import 'package:university_app/Components/EventAndNotice/user_event_and_notice_page.dart';
import 'package:university_app/Components/UserDashboard/Users/Alumni/alumni_profile_page.dart';
import 'package:university_app/Components/UserDashboard/Users/controller_user.dart';
import 'package:university_app/Components/global_ui_helper.dart';

class AlumniDashboard extends StatefulWidget {
  const AlumniDashboard({super.key});

  @override
  State<AlumniDashboard> createState() => _AlumniDashboardState();
}

class _AlumniDashboardState extends State<AlumniDashboard> {
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
              builder: (context) => AlumniProfilePage(
                userInfo: userInfo,
              ),
            ));
          },
        ),
        _buildDashboardItem(
          context,
          'Events and News',
          Icons.event,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const EventAndNewsPage(
                  forWhom: 4444,
                ),
              ),
            );
          },
        ),
        _buildDashboardItem(
          context,
          'Faculty List',
          Icons.people,
          () {
            // Navigate to faculty list screen
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
