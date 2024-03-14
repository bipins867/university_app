import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/StudyMaterial/Branch/Semester/Subject/PdfData/pdf_data_page.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({super.key});
  final List<Map<String, String>> subjects = const [
    {
      'title': 'Mathematics',
      'description': 'Fundamental mathematics concepts and applications'
    },
    {
      'title': 'Computer Science',
      'description':
          'Introduction to computer science principles and programming'
    },
    {
      'title': 'Physics',
      'description':
          'Study of natural phenomena and laws governing the universe'
    },
    {
      'title': 'Chemistry',
      'description':
          'Study of the composition, structure, and properties of matter'
    },
    {
      'title': 'English',
      'description': 'Language skills development and literature analysis'
    },
    {
      'title': 'Mechanical Engineering',
      'description': 'Principles of mechanical systems and design'
    },
    {
      'title': 'Electrical Engineering',
      'description': 'Study of electrical circuits and systems'
    },
    {
      'title': 'Civil Engineering',
      'description': 'Design and construction of infrastructure and buildings'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subject'),
      ),
      body: ListView(
          children: subjects.map(
        (subject) {
          return CourseCard(
            course: subject['title']!,
            description: subject['description']!,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PdfListPage(),
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
