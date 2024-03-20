import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/Users/Student/student_profile_page.dart';
import 'package:university_app/Components/global_controller.dart';

class MemberListPage extends StatefulWidget {
  final int yearId;
  const MemberListPage({super.key, required this.yearId});

  @override
  State<MemberListPage> createState() => _MemberListPageState();
}

class _MemberListPageState extends State<MemberListPage> {
  List members = [];
  @override
  void initState() {
    GlobalController.postRequest(
        'clubAndSociety/get/members', {"yearId": widget.yearId}).then((data) {
      setState(() {
        members = data['members'];
      });
      //log(data.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Members List'),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return _buildMemberCard(context, member);
        },
      ),
    );
  }

  Widget _buildMemberCard(BuildContext context, member) {
    Map studentInfo = member['studentInof'];
    Map userProfile = studentInfo['userProfile'];

    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(userProfile['name']),
        subtitle: Text(studentInfo['designation']),
        trailing: studentInfo['isAdmin']
            ? const Icon(Icons.admin_panel_settings)
            : null,
        onTap: () {
          userProfile['collegeId'] = studentInfo['collegeId'];
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StudentProfilePage(userInfo: userProfile),
            ),
          );
        },
      ),
    );
  }
}
