import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future getFacultyList() async {
  var remoteIp = dotenv.env['remoteIp'];
  var remotePort = dotenv.env['remotePort'];

  try {
    var uri = Uri.parse('http://$remoteIp:$remotePort/user/getFacultyList');

    var response = await http.get(
      uri,
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw "Something went Wrong";
    }

    final data = jsonDecode(response.body);

    return data;
  } on Exception catch (e) {
    return e;
  }
}
