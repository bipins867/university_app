import 'package:flutter/material.dart';

class GlobalUi {
  static createNormalAlertBox(
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
              style: const TextStyle(color: Color.fromARGB(255, 31, 170, 105)),
            ),
          );
        });
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

  static Widget createCircularImage(
      String imageUrl, IconData defaultIcon, double radius) {
    Widget image = imageUrl == ''
        ? CircleAvatar(
            radius: radius,
            child: Icon(
              defaultIcon,
              size: 80.0,
              color: Colors.grey[600],
            ),
          )
        : CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(imageUrl),
          );
    return image;
  }

  static Widget getImage(String imageUrl, IconData defaultIcon) {
    Widget image = imageUrl == ''
        ? Icon(defaultIcon)
        : Image.network(
            imageUrl,
            fit: BoxFit.cover,
          );
    return image;
  }
}
