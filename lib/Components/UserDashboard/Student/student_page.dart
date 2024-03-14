import 'package:flutter/material.dart';
import 'package:university_app/Components/EventAndNotice/user_event_and_notice_page.dart';
import 'package:university_app/Components/UserDashboard/FacultyList/faculty_list_page.dart';
import 'package:university_app/Components/UserDashboard/PreviousYearQuestions/previous_year_questions_page.dart';
import 'package:university_app/Components/UserDashboard/StudyMaterial/study_material_page.dart';
import 'package:university_app/Components/UserDashboard/UserProfile/user_profile_page.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        const ListTile(
          title: Text('Welcome, John Doe'),
        ),
        const SizedBox(height: 20.0),
        _buildDashboardItem(
          context,
          'View Profile',
          Icons.person,
          () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserProfilePage(),
            ));
          },
        ),
        _buildDashboardItem(
          context,
          'Event & Notice Section',
          Icons.event,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const EventAndNewsPage(),
              ),
            );
          },
        ),
        _buildDashboardItem(
          context,
          'Study Materials',
          Icons.book,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const StudyMaterialPage(),
              ),
            );
          },
        ),
        _buildDashboardItem(
          context,
          'Previous Year Questions',
          Icons.question_answer,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PreviousYearQuestionPage(),
              ),
            );
          },
        ),
        _buildDashboardItem(
          context,
          'Faculty List',
          Icons.people,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FacultyListPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDashboardItem(BuildContext context, String title, IconData icon,
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
