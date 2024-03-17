import 'package:flutter/material.dart';

class GlobalUi {
  static createErrorAlertBox(
      BuildContext context, String title, String content) {
    showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            content: Text(
              content,
              style: const TextStyle(color: Colors.red),
            ),
          );
        });
  }
}
