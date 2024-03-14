import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/StudyMaterial/Branch/Semester/Subject/subject_page.dart';

class SemesterPage extends StatelessWidget {
  const SemesterPage({super.key});
  final List<Map<String, String>> semesters = const [
    {
      'title': 'Semester I',
      'description': 'First semester of the academic year'
    },
    {
      'title': 'Semester II',
      'description': 'Second semester of the academic year'
    },
    {
      'title': 'Semester III',
      'description': 'Third semester of the academic year'
    },
    {
      'title': 'Semester IV',
      'description': 'Fourth semester of the academic year'
    },
    {
      'title': 'Semester V',
      'description': 'Fifth semester of the academic year'
    },
    {
      'title': 'Semester VI',
      'description': 'Sixth semester of the academic year'
    },
    {
      'title': 'Semester VII',
      'description': 'Seventh semester of the academic year'
    },
    {
      'title': 'Semester VIII',
      'description': 'Eighth semester of the academic year'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semester'),
      ),
      body: ListView(
          children: semesters.map(
        (semester) {
          return CourseCard(
            course: semester['title']!,
            description: semester['description']!,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SubjectPage(),
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
