import 'package:flutter/material.dart';

class LeaderList extends StatelessWidget {
  const LeaderList({super.key});

  final List leadersInfo = const [
    {
      'id': 1,
      'image_path': 'assets/Home/LeaderImages/Chancellor-111.png',
      'title': 'Smt.Anandiben Patel',
      'subTitle': "Hon'ble Chancellor & H.E. Governor of U.P."
    },
    {
      'id': 2,
      'image_path': 'assets/Home/LeaderImages/CM-G.png',
      'title': 'Shri Yogi Adityanath',
      'subTitle': "Hon'ble Chief Minister of U.P."
    },
    {
      'id': 3,
      'image_path': 'assets/Home/LeaderImages/ShriAshishPatel.png',
      'title': 'Shri Ashish Patel',
      'subTitle': "Hon'ble Minister for Technical Education, U.P."
    },
    {
      'id': 4,
      'image_path': 'assets/Home/LeaderImages/VC2.png',
      'title': 'Prof. Jai Prakash Saini',
      'subTitle': "Hon'ble Vice Chancellor"
    },
  ];

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
              backgroundImage: AssetImage(leader['image_path']),
            ),
            title: Center(
              child: Text(
                leader['title'],
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
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    minimumSize: MaterialStateProperty.all(
                      const Size(100, 20),
                    ),
                  ),
                  child: const Text(
                    "Message",
                    style: TextStyle(fontSize: 10),
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
