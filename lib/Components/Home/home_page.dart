import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_app/Components/EventAndNotice/user_event_and_notice_page.dart';
import 'package:university_app/Components/Home/Body/body_page.dart';
import 'package:university_app/Components/Home/BottomNavigation/bottom_navigation_system.dart';
import 'package:university_app/Components/Drawer/drawer_page.dart';

import 'package:university_app/Components/Home/UserLogin/user_login_page.dart';
import 'package:university_app/Store/global_state_management.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final globalStateHandler = Provider.of<GlobalStateHandler>(context);

    final bodyWidgests = [
      const BodyPage(),
      const EventAndNewsPage(
        forWhom: 1111,
      ),
      const UserLoginPage()
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/Home/mmm_logo.jpg',
          height: 40,
        ),
      ),
      drawer: const HomeDrawer(),
      body: bodyWidgests[globalStateHandler.selectHomePage],
      bottomNavigationBar: const HomeBottomNavigationSystem(),
    );
  }
}
