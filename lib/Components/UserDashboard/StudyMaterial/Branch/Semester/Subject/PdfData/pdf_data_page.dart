import 'package:flutter/material.dart';

class PdfListPage extends StatelessWidget {
  const PdfListPage({Key? key}) : super(key: key);

  final List<Map<String, String>> pdfList = const [
    {
      'name': 'Introduction to Flutter',
      'description': 'A beginner\'s guide to Flutter development'
    },
    {
      'name': 'Advanced Data Structures',
      'description': 'In-depth exploration of advanced data structures'
    },
    {
      'name': 'Machine Learning Basics',
      'description': 'Fundamentals of machine learning algorithms and concepts'
    },
    {
      'name': 'Networking Essentials',
      'description': 'Understanding networking protocols and architectures'
    },
    {
      'name': 'Web Development with React',
      'description': 'Building web applications using the React framework'
    },
    {
      'name': 'Database Design Principles',
      'description': 'Best practices for designing efficient databases'
    },
    {
      'name': 'Operating System Concepts',
      'description': 'Key principles and components of operating systems'
    },
    {
      'name': 'Artificial Intelligence Fundamentals',
      'description': 'Overview of AI algorithms and applications'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF List'),
      ),
      body: ListView.builder(
        itemCount: pdfList.length,
        itemBuilder: (context, index) {
          final pdf = pdfList[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            elevation: 4.0,
            child: ListTile(
              title: Text(
                pdf['name'] ?? '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(pdf['description'] ?? ''),
              trailing: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Text('View/Download'),
              ),
            ),
          );
        },
      ),
    );
  }
}
