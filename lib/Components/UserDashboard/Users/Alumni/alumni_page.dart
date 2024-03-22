import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_app/Components/UserDashboard/Users/Alumni/alumni_profile_page.dart';
import 'package:university_app/Components/global_controller.dart';

import 'package:university_app/Components/global_ui_helper.dart';
import 'package:university_app/Store/global_state_management.dart';

class AlumniDashboard extends StatefulWidget {
  const AlumniDashboard({super.key});

  @override
  State<AlumniDashboard> createState() => _AlumniDashboardState();
}

class _AlumniDashboardState extends State<AlumniDashboard> {
  Map userInfo = {"name": ""};

  SharedPreferences? _sharedPreferences;

  @override
  void initState() {
    SharedPreferences.getInstance().then(
      (value) {
        _sharedPreferences = value;
        String? token = _sharedPreferences?.getString('token');
        if (token == null) {
          return Provider.of<GlobalStateHandler>(context, listen: false)
              .setIsLoggedIn(false);
        }
        GlobalController.postWithToken('user/get/userInfo', {}, token).then(
          (value) {
            setState(() {
              userInfo = value['userInfo'];
            });
          },
        ).onError((error, stackTrace) {
          GlobalUi.createErrorAlertBox(context, 'Error', error.toString());
        });
      },
    );

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
