import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_app/Components/Department/DepartmentFacultyList/department_faculty_list_page.dart';
import 'package:university_app/Components/Department/DepartmentInfo/department_info_page.dart';
import 'package:university_app/Components/EventAndNotice/user_event_and_notice_page.dart';
import 'package:university_app/Components/NotificationForm/NotiifcationForm.dart';
import 'package:university_app/Components/global_ui_helper.dart';
import 'package:university_app/Store/global_state_management.dart';

class DepartmentHomePage extends StatelessWidget {
  final Map departmentInfo;
  const DepartmentHomePage({super.key, required this.departmentInfo});

  Widget getNotificationWidget(globalStateHandler, bodyInfo, context) {
    if (globalStateHandler.isLoggedIn) {
      if (globalStateHandler.userType == 'faculty' &&
          globalStateHandler.userInfo['id'] == departmentInfo['hodId']) {
        return _buildDashboardItem(
            context, 'Send Notification', Icons.notification_add, () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NotificationFormPage(
                    bodyObj: bodyInfo,
                    path: 'department',
                  )));
        });
      }
    }

    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final globalStateHandler = Provider.of<GlobalStateHandler>(context);
    Map bodyInfo = {
      "departmentId": departmentInfo['id'],
      'createrName': globalStateHandler.userInfo['name'],
      'createrDesignation': globalStateHandler.userInfo['designation']
    };
    Widget backgroundImage =
        GlobalUi.getImage(departmentInfo['imageUrl'], Icons.school);
    Widget sendNotification =
        getNotificationWidget(globalStateHandler, bodyInfo, context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Department of ${departmentInfo['title']}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        departmentInfo['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Subtitle
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        departmentInfo['subTitle'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: backgroundImage),
                  ]
                  // Title
                  ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildDashboardItem(context, 'About', Icons.info_outline, () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DepartmentInfoHomePage(
                            departmentInfo: departmentInfo),
                      ),
                    );
                  }),
                  _buildDashboardItem(
                      context, 'Event and Notice', Icons.event_note, () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EventAndNewsPage(
                          forWhom: 'department',
                          requestObj: {'departmentId': departmentInfo['id']},
                        ),
                      ),
                    );
                  }),
                  _buildDashboardItem(context, 'Faculty List', Icons.people,
                      () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DepartmentFacultyListPage(
                          departmentId: departmentInfo['id']),
                    ));
                  }),
                  sendNotification
                ],
              ),
            ),
          ],
        ),
      ),
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
