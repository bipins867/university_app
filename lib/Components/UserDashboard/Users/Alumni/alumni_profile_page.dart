import 'package:flutter/material.dart';
import 'package:university_app/Components/global_ui_helper.dart';

class AlumniProfilePage extends StatelessWidget {
  final Map userInfo;

  const AlumniProfilePage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    Widget userImage =
        GlobalUi.createCircularImage(userInfo['profilePic'], Icons.person, 80);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: userImage),
            const SizedBox(height: 20.0),
            buildDetailRow('Name', userInfo['name']),
            buildDetailRow('College ID', userInfo['collegeId'].toString()),
            buildDetailRow('Course', userInfo['course']),
            buildDetailRow(
                'Year of Passing', userInfo['yearOfPassing'].toString()),
            buildDetailRow(
                'Current Affiliation', userInfo['currentAffiliation']),
            buildDetailRow('Phone', userInfo['phone']),
            buildDetailRow('Email', userInfo['email']),
            buildDetailRow('Address', userInfo['address']),
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
