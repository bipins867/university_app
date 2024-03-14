import 'package:flutter/material.dart';

class DepartmentFacultyListPage extends StatelessWidget {
  const DepartmentFacultyListPage({super.key});

  // Define the list of faculty members
  final List<Map<String, String>> facultyData = const [
    {'name': 'Prof. John Doe', 'designation': 'Head of Department (HOD)'},
    {'name': 'Dr. Jane Smith', 'designation': 'Professor'},
    {'name': 'Dr. Michael Johnson', 'designation': 'Professor'},
    {'name': 'Dr. Emily Brown', 'designation': 'Assistant Professor'},
    {'name': 'Dr. David Wilson', 'designation': 'Assistant Professor'},
    {'name': 'Guest Faculty 1', 'designation': 'Guest Faculty'},
    {'name': 'Guest Faculty 2', 'designation': 'Guest Faculty'},
    // Add more faculty members as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IT & CS Department'),
      ),
      body: ListView(
        children: facultyData.map((faculty) {
          return _buildFacultyCard(faculty['name']!, faculty['designation']!);
        }).toList(),
      ),
    );
  }

  Widget _buildFacultyCard(String name, String designation) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(designation),
        onTap: () {
          // Handle onTap action (if needed)
        },
      ),
    );
  }
}
