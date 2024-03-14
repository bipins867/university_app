import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/StudyMaterial/Branch/Semester/semester_page.dart';

class BranchPage extends StatelessWidget {
  const BranchPage({super.key});
  final List<Map<String, String>> branches = const [
    {'title': 'CSE', 'description': 'Computer Science and Engineering'},
    {'title': 'IT', 'description': 'Information Technology'},
    {
      'title': 'ECE',
      'description': 'Electronics and Communication Engineering'
    },
    {'title': 'EE', 'description': 'Electrical Engineering'},
    {'title': 'ME', 'description': 'Mechanical Engineering'},
    {'title': 'CE', 'description': 'Civil Engineering'},
    {'title': 'CHE', 'description': 'Chemical Engineering'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branch'),
      ),
      body: ListView(
          children: branches.map(
        (branch) {
          return CourseCard(
            course: branch['title']!,
            description: branch['description']!,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SemesterPage(),
                ),
              );
            },
          );
        },
      ).toList()),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String course;
  final String description;
  final VoidCallback onPressed;

  const CourseCard({
    required this.course,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      child: ListTile(
        title: Text(course),
        subtitle: Text(description),
        onTap: onPressed,
      ),
    );
  }
}
