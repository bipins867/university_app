import 'package:flutter/material.dart';
import 'package:university_app/Components/UserDashboard/StudyMaterial/Branch/Semester/Subject/PdfData/pdf_list_page.dart';
import 'package:university_app/Components/global_controller.dart';

class PdfPage extends StatefulWidget {
  final int subjectId;

  const PdfPage({super.key, required this.subjectId});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> with TickerProviderStateMixin {
  TextStyle textStyle = const TextStyle(fontWeight: FontWeight.bold);

  List questionPaperList = [];
  List studyMaterialList = [];
  @override
  void initState() {
    GlobalController.postRequest(
            'studyMaterials/get/pdfs', {'subjectId': widget.subjectId})
        .then((data) {
      setState(() {
        questionPaperList = data['questionPaperPdf'];
        studyMaterialList = data['studyMaterialPdf'];
      });
      //log(data.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Study Materials"),
      ),
      body: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.fill,
            tabs: [
              Tab(
                child: Text(
                  "Question Paper",
                  style: textStyle,
                ),
              ),
              Tab(
                child: Text(
                  "Study",
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
                PdfListPage(pdfList: questionPaperList),
                PdfListPage(pdfList: studyMaterialList),
              ],
            ),
          )
        ],
      ),
    );
  }
}
