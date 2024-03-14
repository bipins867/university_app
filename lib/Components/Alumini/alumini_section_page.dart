import 'package:flutter/material.dart';

class AlumniSectionPage extends StatelessWidget {
  const AlumniSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni'),
      ),
      body: ListView(
        children: [
          _buildAlumniItem(
            context,
            'List of Entrepreneurs',
            'Celebrating the success stories of Malviyan entrepreneurs.',
          ),
          _buildAlumniItem(
            context,
            'Patents Granted to Malviyans',
            'Recognizing the innovative contributions of our alumni.',
          ),
          _buildAlumniItem(
            context,
            'Minutes of MAA 3rd Meeting',
            'Stay updated with the discussions and decisions made in the MAA meetings.',
          ),
        ],
      ),
    );
  }

  Widget _buildAlumniItem(BuildContext context, String title, String subtitle) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () {
          // Handle alumni item tap
        },
      ),
    );
  }
}
