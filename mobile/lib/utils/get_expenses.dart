import 'package:http/http.dart' as http;
import 'package:mobile/utils/model_definitions.dart';
import 'dart:convert';

Future<ExpenseData> fetchExpenses(String i) async {
  final response = await http
      .get(Uri.parse('https://effective-fortnight-gv69rjgxw7w2wwgx-8000.app.github.dev/Expenses/$i'));

  if (response.statusCode == 200) {
    return ExpenseData.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}
