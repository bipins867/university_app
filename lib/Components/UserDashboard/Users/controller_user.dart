import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future getUserProfileInfo() async {
  var remoteIp = dotenv.env['remoteIp'];
  var remotePort = dotenv.env['remotePort'];
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  String? token = _sharedPreferences.getString('token');
  if (token == null) {
    throw "Invalid Token";
  }
  try {
    var uri = Uri.parse('http://$remoteIp:$remotePort/dashboard/getUserInfo');

    var response = await http.get(
      uri,
      headers: {'content-type': 'application/json', 'token': token},
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
