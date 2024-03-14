import 'package:flutter/material.dart';

class FacultyProfilePage extends StatelessWidget {
  final Map<String, String> faculty = const {
    'name': 'John Doe',
    'qualification': 'Ph.D. in Computer Science',
    'area_of_specialization': 'Artificial Intelligence',
    'designation': 'Professor',
    'date_of_joining': 'January 1, 2010',
    'contact_info': 'john.doe@example.com',
  };

  const FacultyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 80,
                child: Icon(
                  Icons.person,
                  size: 80,
                ),
                // backgroundImage:
                //     NetworkImage('URL_TO_IMAGE'), // Add URL to faculty image
              ),
            ),
            const SizedBox(height: 24),
            _buildProfileInfo('Name', faculty['name'] ?? ''),
            _buildProfileInfo('Qualification', faculty['qualification'] ?? ''),
            _buildProfileInfo('Area of Specialization',
                faculty['area_of_specialization'] ?? ''),
            _buildProfileInfo('Designation', faculty['designation'] ?? ''),
            _buildProfileInfo(
                'Date of Joining', faculty['date_of_joining'] ?? ''),
            _buildProfileInfo('Contact Info', faculty['contact_info'] ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String tag, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tag,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.grey[800]),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
