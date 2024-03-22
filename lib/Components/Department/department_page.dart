import 'package:flutter/material.dart';
import 'package:university_app/Components/Department/HomePage/department_home_page.dart';
import 'package:university_app/Components/global_controller.dart';

class DepartmentListPage extends StatefulWidget {
  const DepartmentListPage({super.key});

  @override
  State<DepartmentListPage> createState() => _DepartmentListPageState();
}

class _DepartmentListPageState extends State<DepartmentListPage> {
  List departments = [];
  @override
  void initState() {
    GlobalController.getRequest('department/get/departments').then((data) {
      setState(() {
        departments = data['departments'];
      });
      //log(data.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Department List'),
      ),
      body: ListView.builder(
        itemCount: departments.length,
        itemBuilder: (context, index) {
          Map department = departments[index];

          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  //builder: (context) => DepartmentHomePage(),
                  // builder: (context) => const DepartmentFacultyListPage(),
                  builder: (context) => DepartmentHomePage(
                    departmentInfo: department,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(department['title'] ?? ''),
                subtitle: Text(department['subTitle'] ?? ''),
              ),
            ),
          );
        },
      ),
    );
  }
}
