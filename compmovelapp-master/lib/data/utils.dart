import 'dart:convert';

import 'package:fossil/data/payload.dart';
import 'package:http/http.dart' as http;

Future<Payload> fetchPayload(String id) async {
  final response = await http.get('http://18.228.58.15:8888/api/items/$id');
  if (response.statusCode == 200) {
    final payload = Payload.fromJson(json.decode(response.body));
    return payload;
  } else {
    throw Exception('Failed to load post.');
  }
}