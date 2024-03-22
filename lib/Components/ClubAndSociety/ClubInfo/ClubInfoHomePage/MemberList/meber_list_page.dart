import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/Users/Student/student_profile_page.dart';
import 'package:university_app/Components/global_controller.dart';

class MemberListPage extends StatefulWidget {
  final int clubAndSocietyId;
  const MemberListPage({super.key, required this.clubAndSocietyId});

  @override
  State<MemberListPage> createState() => _MemberListPageState();
}

class _MemberListPageState extends State<MemberListPage> {
  List members = [];
  @override
  void initState() {
    GlobalController.postRequest('clubAndSociety/get/members',
        {"clubAndSocietyId": widget.clubAndSocietyId}).then((data) {
      setState(() {
        members = data['members'];
      });
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
    Map ClubAndSocietyMember = member['ClubAndSocietyMember'];

    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(member['name']),
        subtitle: Text(ClubAndSocietyMember['designation']),
        trailing: ClubAndSocietyMember['isAdmin']
            ? const Icon(Icons.admin_panel_settings)
            : null,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StudentProfilePage(userInfo: member),
            ),
          );
        },
      ),
    );
  }
}
