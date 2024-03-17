import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  final List noticeList;
  const NoticePage({super.key, required this.noticeList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticeList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildNoticeCard(noticeList[index]);
      },
    );
  }

  Widget buildNoticeCard(Map notice) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notice['title'],
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              notice['subTitle'],
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle button press if needed
                },
                child: const Text('View More'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
