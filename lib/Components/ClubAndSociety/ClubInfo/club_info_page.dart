import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_app/Components/ClubAndSociety/ClubInfo/ClubInfoHomePage/MemberList/meber_list_page.dart';
import 'package:university_app/Components/ClubAndSociety/ClubInfo/ClubInfoHomePage/club_info_home_page.dart';
import 'package:university_app/Components/EventAndNotice/user_event_and_notice_page.dart';
import 'package:university_app/Components/NotificationForm/NotiifcationForm.dart';
import 'package:university_app/Components/global_controller.dart';
import 'package:university_app/Components/global_ui_helper.dart';
import 'package:university_app/Store/global_state_management.dart';

class ClubInfoPage extends StatefulWidget {
  final Map clubInfo;
  const ClubInfoPage({super.key, required this.clubInfo});

  @override
  State<ClubInfoPage> createState() => _ClubInfoPageState();
}

class _ClubInfoPageState extends State<ClubInfoPage> {
  List members = [];
  Map userInfo = {};
  Map bodyInfo = {};
  @override
  void initState() {
    GlobalController.postRequest('clubAndSociety/get/members',
        {"clubAndSocietyId": widget.clubInfo['id']}).then((data) {
      setState(() {
        members = data['members'];
      });
    }).catchError((err) {
      log(err);
    });
    super.initState();
  }

  Widget getNotificationWidget(globalStateHandler, bodyInfo, context) {
    if (globalStateHandler.isLoggedIn) {
      if (globalStateHandler.userType == 'student') {
        for (Map member in members) {
          if (member['UserId'] == userInfo['UserId']) {
            bodyInfo['createrName'] = userInfo['name'];
            bodyInfo['createrDesignation'] =
                member['ClubAndSocietyMember']['designation'];
            bodyInfo['clubAndSocietyId'] = widget.clubInfo['id'];

            return _buildClubItem(
              context,
              'Send Notification',
              Icons.notification_add,
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => NotificationFormPage(
                          bodyObj: bodyInfo, path: 'clubAndSociety')),
                );
              },
            );
          }
        }
      }
    }

    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final globalStateHandler = Provider.of<GlobalStateHandler>(context);

    Widget sendNotification =
        getNotificationWidget(globalStateHandler, bodyInfo, context);
    userInfo = globalStateHandler.userInfo;
    Widget backgroundImage =
        GlobalUi.getImage(widget.clubInfo['profilePic'], Icons.school);
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
                    widget.clubInfo['title'],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.clubInfo['subTitle'],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: backgroundImage),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildClubItem(
                    context,
                    'About',
                    Icons.info_outline,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ClubInfoHomePage(
                            clubInfo: widget.clubInfo,
                          ),
                        ),
                      );
                    },
                  ),
                  _buildClubItem(
                    context,
                    'Members List',
                    Icons.people,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MemberListPage(
                            members: members,
                          ),
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
                          builder: (context) => EventAndNewsPage(
                            forWhom: 'clubAndSociety',
                            requestObj: {
                              'clubAndSocietyId': widget.clubInfo['id']
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  sendNotification
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
