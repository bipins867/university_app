import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:university_app/Components/global_controller.dart';
import 'package:university_app/Components/global_ui_helper.dart';

// ignore: must_be_immutable
class NotificationFormPage extends StatefulWidget {
  Map bodyObj;
  String path;
  NotificationFormPage({super.key, required this.bodyObj, required this.path});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationFormPageState createState() => _NotificationFormPageState();
}

class _NotificationFormPageState extends State<NotificationFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subTitleController = TextEditingController();

  bool _isEvent = false;
  void _submitForm() {
    String title = _titleController.text;
    String subTitle = _subTitleController.text;

    widget.bodyObj['title'] = title;
    widget.bodyObj['subTitle'] = subTitle;
    widget.bodyObj['isEvent'] = _isEvent;

    GlobalController.postRequest(
            'notifications/create/${widget.path}', widget.bodyObj)
        .then(
      (value) {
        GlobalUi.createNormalAlertBox(
            context, "Status", "Notification Successfully Sent!");
      },
    ).onError((error, stackTrace) {
      GlobalUi.createErrorAlertBox(context, 'Error', error.toString());
    });
    // Here you can submit the data or perform any other actions
  }

  @override
  Widget build(BuildContext context) {
    log(widget.bodyObj.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _subTitleController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Sub Title (About)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a sub title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  const Text('Is Event:'),
                  Switch(
                    value: _isEvent,
                    onChanged: (value) {
                      setState(() {
                        _isEvent = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, proceed with submission
                      _submitForm();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subTitleController.dispose();
    super.dispose();
  }
}
