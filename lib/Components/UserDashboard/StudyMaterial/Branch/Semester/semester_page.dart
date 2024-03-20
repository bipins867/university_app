import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/StudyMaterial/Branch/Semester/Subject/subject_page.dart';
import 'package:university_app/Components/global_controller.dart';

class SemesterPage extends StatefulWidget {
  final int branchId;
  const SemesterPage({super.key, required this.branchId});

  @override
  State<SemesterPage> createState() => _SemesterPageState();
}

class _SemesterPageState extends State<SemesterPage> {
  List semesters = [];
  @override
  void initState() {
    GlobalController.postRequest(
            'studyMaterials/get/Semester', {'branchId': widget.branchId})
        .then((data) {
      setState(() {
        semesters = data['semesters'];
      });
      //log(data.toString());
    });
    super.initState();
  }

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
            description: semester['subTitle']!,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SubjectPage(
                    semesterId: semester['id'],
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
