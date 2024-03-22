import 'package:flutter/material.dart';

class FacultyProfilePage extends StatelessWidget {
  final Map userInfo;

  const FacultyProfilePage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80.0,
                backgroundColor: Colors.grey[300],
                // Replace 'imageUrl' with the URL of the user's profile picture
                // backgroundImage: NetworkImage(user.imageUrl),
                child: Icon(
                  Icons.person,
                  size: 80.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            buildDetailRow('Name', userInfo['name']),
            buildDetailRow('collegeId', userInfo['collegeId']),
            buildDetailRow('Qualification', userInfo['qualification']),
            buildDetailRow(
                'Area of Specialization', userInfo['areaOfSpecialization']),
            buildDetailRow('Designation', userInfo['designation']),
            buildDetailRow('Date of Joining', userInfo['dateOfJoining']),
            buildDetailRow('Phone', userInfo['phone']),
            buildDetailRow('Email', userInfo['email']),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, dynamic value) {
    if (value == null) {
      return const SizedBox(
        height: 0,
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            flex: 5,
            child: Text(
              value.toString(),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
