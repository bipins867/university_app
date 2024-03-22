import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future userLogin(collegeId, password, userType) async {
  var remoteIp = dotenv.env['remoteIp'];
  var remotePort = dotenv.env['remotePort'];

  try {
    var uri = Uri.parse('http://$remoteIp:$remotePort/auth/login');

    var response = await http.post(uri,
        headers: {'content-type': 'application/json'},
        body: jsonEncode({
          'collegeId': collegeId,
          'password': password,
          'userType': userType
        }));

    if (response.statusCode != 200) {
      throw "Something went Wrong";
    }

    final data = jsonDecode(response.body);

    return data;
  } on Exception catch (e) {
    return e;
  }
}
