import 'package:flutter/material.dart';
import 'package:university_app/Components/ClubAndSociety/ClubInfo/YearList/year_list_page.dart';
import 'package:university_app/Components/EventAndNotice/user_event_and_notice_page.dart';

class ClubInfoPage extends StatelessWidget {
  const ClubInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clubs and Societies'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Day Scholar\'s Club (DSC)',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A club for students residing outside the campus',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/Home/ImageSlide/6.jpg', // Replace with your image asset path
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildClubItem(
                    context,
                    'Members List',
                    Icons.people,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const YearListPage(),
                        ),
                      );
                    },
                  ),
                  _buildClubItem(
                    context,
                    'Events & Notice',
                    Icons.event,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EventAndNewsPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildClubItem(BuildContext context, String title, IconData icon,
      VoidCallback onPressed) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onPressed,
      ),
    );
  }
}
