import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/FacultyList/faculty_profile_page.dart';

class FacultyListPage extends StatelessWidget {
  const FacultyListPage({super.key});

  final List<Map<String, String>> facultyList = const [
    {
      'name': 'Dr. John Doe',
      'designation': 'Professor',
      'area_of_specialization': 'Computer Science'
    },
    {
      'name': 'Prof. Jane Smith',
      'designation': 'Associate Professor',
      'area_of_specialization': 'Electrical Engineering'
    },
    {
      'name': 'Dr. Mike Johnson',
      'designation': 'Assistant Professor',
      'area_of_specialization': 'Mechanical Engineering'
    },
    {
      'name': 'Prof. Emily Brown',
      'designation': 'Professor',
      'area_of_specialization': 'Civil Engineering'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty List'),
      ),
      body: ListView.builder(
        itemCount: facultyList.length,
        itemBuilder: (context, index) {
          final faculty = facultyList[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FacultyProfilePage(),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      faculty['name'] ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(faculty['designation'] ?? ''),
                    Text(faculty['area_of_specialization'] ?? ''),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
