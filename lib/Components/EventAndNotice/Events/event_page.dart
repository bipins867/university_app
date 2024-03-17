import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  final List eventList;
  const EventPage({super.key, required this.eventList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: eventList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildEventCard(eventList[index]);
      },
    );
  }

  Widget buildEventCard(Map event) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event['title'],
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              event['subTitle'],
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to the event details page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailsPage(event)));
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
