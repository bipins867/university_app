import 'package:flutter/material.dart';
import 'package:university_app/Components/Alumini/alumini_section_page.dart';
import 'package:university_app/Components/ClubAndSociety/club_and_society_page.dart';
import 'package:university_app/Components/UserDashboard/dashboard_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  popFirst(context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DashboardPage(),
                ),
              );
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
                  builder: (context) => const AlumniSectionPage(),
                ),
              );
            },
            child: const Text('Alumini'),
          ),
        ],
      ),
    );
  }
}
