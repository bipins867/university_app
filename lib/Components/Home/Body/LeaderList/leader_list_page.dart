import 'package:flutter/material.dart';
import 'package:university_app/Components/global_controller.dart';

class LeaderList extends StatefulWidget {
  const LeaderList({super.key});

  @override
  State<LeaderList> createState() => _LeaderListState();
}

class _LeaderListState extends State<LeaderList> {
  List leadersInfo = const [];
  @override
  void initState() {
    GlobalController.getRequest('home/get/leaders').then(
      (info) {
        setState(() {
          leadersInfo = info['leaders'];
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: leadersInfo.map((leader) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Set the border color
            borderRadius: BorderRadius.circular(10.0), // Set the border radius
          ),
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(leader['profilePic']),
            ),
            title: Center(
              child: Text(
                leader['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  leader['subTitle'],
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
