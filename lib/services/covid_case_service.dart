import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/cases.dart';
import '../model/cities.dart';

class CasesService {
  Future<Cases> getCases() async {
    var response = await http.get('https://covid19.sd/data.json');

    return response.statusCode == 200
        ? Cases.fromJson(json.decode(response.body))
        : null;
  }

  Future<List<Cities>> getCitiesCases() async {
    // var response = await http.get('https://covid19.sd/cities.json');

    http.Response response = await http.get('https://covid19.sd/cities.json',
        headers: {'Content-Type': 'application/json'});

    List<dynamic> res = json.decode(utf8.decode(response.bodyBytes));
    print(res);
    return res.map((e) => Cities.fromJson(json.encode(e))).toList();
  }
}
