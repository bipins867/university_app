import 'package:flutter/material.dart';
import 'package:university_app/Components/ClubAndSociety/ClubInfo/club_info_page.dart';

class ClubSocietyPage extends StatelessWidget {
  const ClubSocietyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clubs & Societies'),
      ),
      // drawer: const HomeDrawer(),
      body: ListView(
        children: [
          _buildClubSocietyItem(
            context,
            'Music Club',
            'Where words fail, music speaks.',
          ),
          _buildClubSocietyItem(
            context,
            'Art Society',
            'Every artist was first an amateur.',
          ),
          _buildClubSocietyItem(
            context,
            'Literary Club',
            'The pen is mightier than the sword.',
          ),
          _buildClubSocietyItem(
            context,
            'Dance Club',
            'Dance like nobody\'s watching.',
          ),
          _buildClubSocietyItem(
            context,
            'Coding Club',
            'In code we trust.',
          ),
        ],
      ),
    );
  }

  Widget _buildClubSocietyItem(
      BuildContext context, String title, String subtitle) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ClubInfoPage(),
            ),
          );
        },
      ),
    );
  }
}
