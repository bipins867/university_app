import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notices.length,
      itemBuilder: (BuildContext context, int index) {
        return buildNoticeCard(notices[index]);
      },
    );
  }

  Widget buildNoticeCard(Notice notice) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notice.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              notice.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle button press if needed
                },
                child: Text('View More'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Notice {
  final String title;
  final String description;

  Notice({required this.title, required this.description});
}

// Sample list of notices
List<Notice> notices = [
  Notice(
    title: 'Notice 1',
    description: 'Description of Notice 1...',
  ),
  Notice(
    title: 'Notice 2',
    description: 'Description of Notice 2...',
  ),
  Notice(
    title: 'Notice 3',
    description: 'Description of Notice 3...',
  ),
  Notice(
    title: 'Notice 4',
    description: 'Description of Notice 4...',
  ),
];
