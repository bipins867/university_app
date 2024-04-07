import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_app/Components/Department/department_page.dart';
import 'package:university_app/Components/Home/UserLogin/user_login_page.dart';
import 'package:university_app/Components/UserDashboard/FacultyList/faculty_list_page.dart';
import 'package:university_app/Components/UserDashboard/StudyMaterial/study_material_page.dart';
import 'package:university_app/Components/ClubAndSociety/club_and_society_page.dart';
import 'package:university_app/Components/UserDashboard/dashboard_page.dart';
import 'package:university_app/Store/global_state_management.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  popFirst(context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final globalStateHandler = Provider.of<GlobalStateHandler>(context);

    return Drawer(
      child: ListView(
        children: [
          Image.asset(
            'assets/Home/mmm_logo.jpg',
            height: 50,
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () {
              popFirst(context);
              if (globalStateHandler.isLoggedIn) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DashboardPage(),
                  ),
                );
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UserLoginPage(),
                  ),
                );
              }
            },
            child: const Text('Dashboard'),
          ),
          TextButton(
            onPressed: () {
              popFirst(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ClubSocietyPage(),
                ),
              );
            },
            child: const Text('Club & Societies'),
          ),
          TextButton(
            onPressed: () {
              popFirst(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StudyMaterialPage(),
                ),
              );
            },
            child: const Text('Study Materials'),
          ),
          TextButton(
            onPressed: () {
              popFirst(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DepartmentListPage(),
                ),
              );
            },
            child: const Text('Departments'),
          ),
          TextButton(
            onPressed: () {
              popFirst(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FacultyListPage(),
                ),
              );
            },
            child: const Text('Faculites'),
          )
        ],
      ),
    );
  }
}
