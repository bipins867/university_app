import 'package:flutter/material.dart';
import 'package:university_app/Components/Department/DepartmentFacultyList/department_faculty_list_page.dart';
import 'package:university_app/Components/Department/DepartmentInfo/department_info_page.dart';

class DepartmentHomePage extends StatelessWidget {
  final Map departmentInfo;
  const DepartmentHomePage({super.key, required this.departmentInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Department of ${departmentInfo['title']}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        departmentInfo['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Subtitle
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        departmentInfo['subTitle'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/Home/ImageSlide/6.jpg', // Replace with your image asset path
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]
                  // Title
                  ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildDashboardItem(context, 'About', Icons.info_outline, () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DepartmentInfoHomePage(
                            departmentInfo: departmentInfo),
                      ),
                    );
                  }),
                  _buildDashboardItem(
                      context, 'Event and Notice', Icons.event_note, () {}),
                  _buildDashboardItem(context, 'Faculty List', Icons.people,
                      () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DepartmentFacultyListPage(
                          departmentId: departmentInfo['id']),
                    ));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
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
