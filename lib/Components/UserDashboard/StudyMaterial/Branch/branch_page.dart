import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/StudyMaterial/Branch/Semester/semester_page.dart';
import 'package:university_app/Components/global_controller.dart';

class BranchPage extends StatefulWidget {
  final int courseId;
  const BranchPage({super.key, required this.courseId});

  @override
  State<BranchPage> createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage> {
  List branches = [];
  @override
  void initState() {
    GlobalController.postRequest(
            'studyMaterials/get/Branch', {'courseId': widget.courseId})
        .then((data) {
      setState(() {
        branches = data['branches'];
      });
      //log(data.toString());
    });
    super.initState();
  }

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
            description: branch['subTitle']!,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SemesterPage(
                    branchId: branch['id'],
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
