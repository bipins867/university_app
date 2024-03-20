import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GlobalController {
  static Future getRequest(String url) async {
    var remoteIp = dotenv.env['remoteIp'];
    var remotePort = dotenv.env['remotePort'];

    try {
      var uri = Uri.parse('http://$remoteIp:$remotePort/$url');

      var response =
          await http.get(uri, headers: {'content-type': 'application/json'});

      if (response.statusCode != 200) {
        throw "Something went Wrong";
      }

      final data = jsonDecode(response.body);

      return data;
    } on Exception catch (e) {
      return e;
    }
  }

  static Future postRequest(String url, Map obj) async {
    var remoteIp = dotenv.env['remoteIp'];
    var remotePort = dotenv.env['remotePort'];

    try {
      var uri = Uri.parse('http://$remoteIp:$remotePort/$url');

      var response = await http.post(uri,
          headers: {'content-type': 'application/json'}, body: jsonEncode(obj));

      if (response.statusCode != 200) {
        throw "Something went Wrong";
      }

      final data = jsonDecode(response.body);

      return data;
    } on Exception catch (e) {
      return e;
    }
  }
}
