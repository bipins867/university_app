import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/Department/department_page.dart';

class FacultyDashboard extends StatelessWidget {
  const FacultyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        const ListTile(
          title: Text('Welcome, Dr. Jane Smith'),
        ),
        const SizedBox(height: 20.0),
        _buildDashboardItem(
          context,
          'View Profile',
          Icons.person,
          () {
            // Navigate to view profile screen
          },
        ),
        _buildDashboardItem(
          context,
          'Events and Notifications',
          Icons.notifications,
          () {
            // Navigate to events and notifications screen
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
