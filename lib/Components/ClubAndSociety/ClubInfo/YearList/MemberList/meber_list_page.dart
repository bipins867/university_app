import 'package:flutter/material.dart';

class MemberListPage extends StatelessWidget {
  final List<Map<String, dynamic>> members = const [
    {'name': 'Admin', 'department': 'Computer Science', 'isAdmin': true},
    {'name': 'John Doe', 'department': 'Computer Science', 'isAdmin': false},
    {
      'name': 'Jane Smith',
      'department': 'Electrical Engineering',
      'isAdmin': false
    },
    {
      'name': 'Alice Johnson',
      'department': 'Mechanical Engineering',
      'isAdmin': false
    },
    {'name': 'Bob Brown', 'department': 'Civil Engineering', 'isAdmin': false},
    {
      'name': 'Chris Lee',
      'department': 'Information Technology',
      'isAdmin': false
    },
    {
      'name': 'Emily Taylor',
      'department': 'Chemical Engineering',
      'isAdmin': false
    },
    {
      'name': 'David Wilson',
      'department': 'Computer Science',
      'isAdmin': false
    },
    {
      'name': 'Eva Martinez',
      'department': 'Electrical Engineering',
      'isAdmin': false
    },
    {
      'name': 'Grace Anderson',
      'department': 'Computer Science',
      'isAdmin': false
    },
  ];

  const MemberListPage({Key? key}) : super(key: key);

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
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(member['name']),
        subtitle: Text(member['department']),
        trailing:
            member['isAdmin'] ? const Icon(Icons.admin_panel_settings) : null,
        onTap: () {
          // Handle member selection
          // You can navigate to another page or perform any other action here
        },
      ),
    );
  }
}
