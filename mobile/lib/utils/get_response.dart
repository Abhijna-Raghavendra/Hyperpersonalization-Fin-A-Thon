import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getResponse(String message) async {
  final response = await http.post(
    Uri.parse(
        'https://effective-fortnight-gv69rjgxw7w2wwgx-8000.app.github.dev/predict/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "saving": message,
    }),
  );

  if (response.statusCode == 200) {
    return response.body;
  } else {
    debugPrint(response.statusCode.toString());
    throw Exception('Failed to load album');
  }
}
