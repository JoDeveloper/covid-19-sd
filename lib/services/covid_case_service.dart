import 'dart:convert';

import 'package:covidsudan/model/world_cases.dart';
import 'package:http/http.dart' as http;

import '../model/cases.dart';

class CasesService {
  Future<Cases> getCases() async {
    var response = await http.get('https://covid19.sd/data.json');

    return response.statusCode == 200
        ? Cases.fromJson(json.decode(response.body))
        : null;
  }

  Future<WorldCases> getWorldCases() async {
    var response = await http.get('https://covid2019-api.herokuapp.com/total');

    return WorldCases.fromJson(json.decode(response.body));
  }
}
