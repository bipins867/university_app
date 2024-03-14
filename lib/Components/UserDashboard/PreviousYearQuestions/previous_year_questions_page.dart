import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/StudyMaterial/Branch/branch_page.dart';

class PreviousYearQuestionPage extends StatelessWidget {
  const PreviousYearQuestionPage({super.key});
  final List<Map<String, String>> courses = const [
    {'title': 'BTech', 'description': 'Bachelor of Technology'},
    {'title': 'MTech', 'description': 'Master of Technology'},
    {'title': 'BBA', 'description': 'Bachelor of Business Administration'},
    {'title': 'MBA', 'description': 'Master of Business Administration'},
    {'title': 'MCA', 'description': 'Master of Computer Applications'},
    {'title': 'MSC', 'description': 'Master of Science'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course'),
      ),
      body: ListView(
          children: courses.map(
        (course) {
          return CourseCard(
            course: course['title']!,
            description: course['description']!,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BranchPage(),
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
