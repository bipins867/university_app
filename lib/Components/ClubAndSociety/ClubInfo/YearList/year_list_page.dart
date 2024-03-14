import 'package:flutter/material.dart';
import 'package:university_app/Components/ClubAndSociety/ClubInfo/YearList/MemberList/meber_list_page.dart';

class YearListPage extends StatelessWidget {
  const YearListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Year'),
      ),
      body: ListView(
        children: [
          _buildYearCard(context, '1st Year'),
          _buildYearCard(context, '2nd Year'),
          _buildYearCard(context, '3rd Year'),
          _buildYearCard(context, '4th Year'),
        ],
      ),
    );
  }

  Widget _buildYearCard(BuildContext context, String year) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(year),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MemberListPage(),
            ),
          );
        },
      ),
    );
  }
}
