import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/Users/Faculty/faculty_profile_page.dart';
import 'package:university_app/Components/global_controller.dart';

class DepartmentFacultyListPage extends StatefulWidget {
  final int departmentId;
  const DepartmentFacultyListPage({super.key, required this.departmentId});

  @override
  State<DepartmentFacultyListPage> createState() =>
      _DepartmentFacultyListPageState();
}

class _DepartmentFacultyListPageState extends State<DepartmentFacultyListPage> {
  // Define the list of faculty members
  List facultyData = [];
  int hodId = 0;
  @override
  void initState() {
    GlobalController.postRequest(
            'department/get/faculties', {'departmentId': widget.departmentId})
        .then((data) {
      setState(() {
        facultyData = data['faculties'];
        hodId = data['hodId'];
      });
      //log(data.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IT & CS Department'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: facultyData.map((faculty) {
            return _buildFacultyCard(faculty, hodId);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildFacultyCard(faculty, hodId) {
    return Card(
      child: ListTile(
        title: Text(faculty['name']),
        subtitle: Text(faculty['designation']),
        trailing: faculty['id'] == hodId
            ? const Icon(Icons.admin_panel_settings)
            : null,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FacultyProfilePage(userInfo: faculty),
            ),
          );
        },
      ),
    );
  }
}
