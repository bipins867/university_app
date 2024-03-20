import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/StudyMaterial/Branch/branch_page.dart';
import 'package:university_app/Components/global_controller.dart';

class StudyMaterialPage extends StatefulWidget {
  const StudyMaterialPage({super.key});

  @override
  State<StudyMaterialPage> createState() => _StudyMaterialPageState();
}

class _StudyMaterialPageState extends State<StudyMaterialPage> {
  List courses = [];
  @override
  void initState() {
    GlobalController.postRequest('studyMaterials/get/Course', {}).then((data) {
      setState(() {
        courses = data['courses'];
      });
      //log(data.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course'),
      ),
      body: ListView(
          children: courses.map(
        (course) {
          return CourseCard(
            course: course['title']!,
            description: course['subTitle']!,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BranchPage(
                    courseId: course['id'],
                  ),
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
    super.key,
    required this.course,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      child: ListTile(
        title: Text(course),
        subtitle: Text(description),
        onTap: onPressed,
      ),
    );
  }
}
