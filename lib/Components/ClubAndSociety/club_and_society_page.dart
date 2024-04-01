import 'package:flutter/material.dart';
import 'package:university_app/Components/ClubAndSociety/ClubInfo/club_info_page.dart';
import 'package:university_app/Components/global_controller.dart';

class ClubSocietyPage extends StatefulWidget {
  const ClubSocietyPage({super.key});

  @override
  State<ClubSocietyPage> createState() => _ClubSocietyPageState();
}

class _ClubSocietyPageState extends State<ClubSocietyPage> {
  List clubAndSocietes = [];
  @override
  void initState() {
    GlobalController.getRequest('clubAndSociety/get/clubAndSocieties')
        .then((data) {
      setState(() {
        clubAndSocietes = data['clubAndSocieties'];
      });
      //log(data.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clubs & Societies'),
      ),
      // drawer: const HomeDrawer(),

      body: ListView.builder(
        itemCount: clubAndSocietes.length,
        itemBuilder: (context, index) {
          Map clubAndSociety = clubAndSocietes[index];

          return _buildClubSocietyItem(context, clubAndSociety['title'],
              clubAndSociety['subTitle'], clubAndSociety);
        },
      ),
    );
  }

  Widget _buildClubSocietyItem(
      BuildContext context, String title, String subtitle, Map clubInfo) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ClubInfoPage(
                clubInfo: clubInfo,
              ),
            ),
          );
        },
      ),
    );
  }
}
