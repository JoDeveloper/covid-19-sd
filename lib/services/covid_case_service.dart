import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/cases.dart';

class CasesService {
  Future<Cases> getCases() async {
    var response = await http.get('https://covid19.sd/data.json');

    return response.statusCode == 200
        ? Cases.fromJson(json.decode(response.body))
        : null;
  }
}
