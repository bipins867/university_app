import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/DepartmentFacultyList/department_faculty_list_page.dart';

class DepartmentListPage extends StatelessWidget {
  final List<Map<String, String>> departments = const [
    {
      'name': 'Civil Engineering',
      'description': 'Description for Civil Engineering'
    },
    {
      'name': 'Mechanical Engineering',
      'description': 'Description for Mechanical Engineering'
    },
    {
      'name': 'Electrical Engineering',
      'description': 'Description for Electrical Engineering'
    },
    {
      'name': 'Electronics & Communication Engineering',
      'description': 'Description for Electronics & Communication Engineering'
    },
    {
      'name': 'Computer Science & Engineering',
      'description': 'Description for Computer Science & Engineering'
    },
    {
      'name': 'Physics and Material Science',
      'description': 'Description for Physics and Material Science'
    },
    {
      'name': 'Department of Humanities & Social Science',
      'description': 'Description for Department of Humanities & Social Science'
    },
    {
      'name': 'Chemical Engineering',
      'description': 'Description for Chemical Engineering'
    },
    {
      'name': 'Information Technology & Computer Application',
      'description':
          'Description for Information Technology & Computer Application'
    },
    {
      'name': 'Chemistry and Environmental Science',
      'description': 'Description for Chemistry and Environmental Science'
    },
    {
      'name': 'Mathematics and Scientific Computing',
      'description': 'Description for Mathematics and Scientific Computing'
    },
    {
      'name': 'Department of Pharmacy',
      'description': 'Description for Department of Pharmacy'
    },
    {
      'name': 'Management Studies',
      'description': 'Description for Management Studies'
    },
  ];

  const DepartmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Department List'),
      ),
      body: ListView.builder(
        itemCount: departments.length,
        itemBuilder: (context, index) {
          final department = departments[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DepartmentFacultyListPage(),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(department['name'] ?? ''),
                subtitle: Text(department['description'] ?? ''),
              ),
            ),
          );
        },
      ),
    );
  }
}
