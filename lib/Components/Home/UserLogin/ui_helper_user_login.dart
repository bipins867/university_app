import 'package:flutter/material.dart';

class UiUsersLogin {
  static inputFields(TextEditingController controller, String hintText,
      IconData iconData, bool hideCond) {
    return TextField(
      controller: controller,
      obscureText: hideCond,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  static input_button(VoidCallback voidCallback, String text) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: voidCallback,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(text),
      ),
    );
  }

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
