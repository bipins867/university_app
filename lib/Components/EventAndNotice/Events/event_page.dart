import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        return buildEventCard(events[index]);
      },
    );
  }

  Widget buildEventCard(Event event) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              event.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to the event details page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailsPage(event)));
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

class Event {
  final String title;
  final String description;

  Event({required this.title, required this.description});
}

// Sample list of events
List<Event> events = [
  Event(
    title: 'Event 1',
    description: 'Description of Event 1...',
  ),
  Event(
    title: 'Event 2',
    description: 'Description of Event 2...',
  ),
  Event(
    title: 'Event 3',
    description: 'Description of Event 3...',
  ),
  Event(
    title: 'Event 4',
    description: 'Description of Event 4...',
  ),
];
