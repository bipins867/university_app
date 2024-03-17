import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final Map userInfo;

  const UserProfilePage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
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
            SizedBox(height: 20.0),
            buildDetailRow('Name', userInfo['name']),
            buildDetailRow('Father\'s Name', userInfo['fathersName']),
            buildDetailRow('College ID', userInfo['collegeId'].toString()),
            buildDetailRow('Department', userInfo['department']),
            buildDetailRow('Contact', userInfo['phone']),
            buildDetailRow('Email', userInfo['email']),
            buildDetailRow('Address', userInfo['address']),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
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
          SizedBox(width: 10.0),
          Expanded(
            flex: 5,
            child: Text(
              value,
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
