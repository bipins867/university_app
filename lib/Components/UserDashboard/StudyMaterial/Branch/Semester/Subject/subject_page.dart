import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/StudyMaterial/Branch/Semester/Subject/PdfData/pdf_data_page.dart';
import 'package:university_app/Components/global_controller.dart';

class SubjectPage extends StatefulWidget {
  final int semesterId;
  const SubjectPage({super.key, required this.semesterId});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  List subjects = [];
  @override
  void initState() {
    GlobalController.postRequest(
            'studyMaterials/get/Subject', {'semesterId': widget.semesterId})
        .then((data) {
      setState(() {
        subjects = data['subjects'];
      });
      //log(data.toString());
    });
    super.initState();
  }

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
            description: subject['subTitle']!,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PdfPage(
                    subjectId: subject['id'],
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
