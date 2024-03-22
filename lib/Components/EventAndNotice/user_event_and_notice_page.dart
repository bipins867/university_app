import 'package:flutter/material.dart';
import 'package:university_app/Components/EventAndNotice/Events/event_page.dart';
import 'package:university_app/Components/EventAndNotice/Notice/notice_page.dart';
import 'package:university_app/Components/global_controller.dart';

class EventAndNewsPage extends StatefulWidget {
  final String forWhom;
  final Map requestObj;
  const EventAndNewsPage(
      {super.key, required this.forWhom, required this.requestObj});

  @override
  State<EventAndNewsPage> createState() => _EventAndNewsPageState();
}

class _EventAndNewsPageState extends State<EventAndNewsPage>
    with TickerProviderStateMixin {
  TextStyle textStyle = const TextStyle(fontWeight: FontWeight.bold);

  List eventList = [];
  List noticeList = [];

  @override
  void initState() {
    GlobalController.postRequest(
            'notifications/get/${widget.forWhom}', widget.requestObj)
        .then((data) {
      setState(() {
        eventList = data['events'];
        noticeList = data['notices'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event & Notice"),
      ),
      body: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.fill,
            tabs: [
              Tab(
                child: Text(
                  "EVENTS",
                  style: textStyle,
                ),
              ),
              Tab(
                child: Text(
                  "LATEST NEWS/NOTICE",
                  style: textStyle,
                ),
              ),
            ],
            controller: tabController,
            //isScrollable: true,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                EventPage(
                  eventList: eventList,
                ),
                NoticePage(
                  noticeList: noticeList,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
