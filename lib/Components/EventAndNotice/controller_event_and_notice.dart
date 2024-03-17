import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future getEventAndNotice(forWhom) async {
  var remoteIp = dotenv.env['remoteIp'];
  var remotePort = dotenv.env['remotePort'];

  try {
    var uri = Uri.parse(
        'http://$remoteIp:$remotePort/eventAndNotice/getEventAndNotice');

    var response = await http.post(uri,
        headers: {'content-type': 'application/json'},
        body: jsonEncode({"forWhom": 1111}));

    if (response.statusCode != 200) {
      throw "Something went Wrong";
    }

    final data = jsonDecode(response.body);

    return data;
  } on Exception catch (e) {
    return e;
  }
}
