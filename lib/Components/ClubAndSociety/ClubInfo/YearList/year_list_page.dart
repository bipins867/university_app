import 'package:flutter/material.dart';
import 'package:university_app/Components/ClubAndSociety/ClubInfo/YearList/MemberList/meber_list_page.dart';
import 'package:university_app/Components/global_controller.dart';

class YearListPage extends StatefulWidget {
  final int clubAndSocietyId;
  const YearListPage({super.key, required this.clubAndSocietyId});

  @override
  State<YearListPage> createState() => _YearListPageState();
}

class _YearListPageState extends State<YearListPage> {
  List years = [];
  @override
  void initState() {
    GlobalController.postRequest('clubAndSociety/get/years',
        {"clubAndSocietyId": widget.clubAndSocietyId}).then((data) {
      setState(() {
        years = data['years'];
      });
      //log(data.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Year'),
        ),
        body: ListView.builder(
          itemCount: years.length,
          itemBuilder: (context, index) {
            Map year = years[index];

            return _buildYearCard(context, year);
          },
        ));
  }

  Widget _buildYearCard(BuildContext context, Map year) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(year['title']),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MemberListPage(
                yearId: year['id'],
              ),
            ),
          );
        },
      ),
    );
  }
}
