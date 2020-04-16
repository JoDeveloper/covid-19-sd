import 'package:flutter/cupertino.dart';

class Cases {
  dynamic totalCases;
  dynamic todayCases;
  dynamic deaths;
  dynamic todayDeaths;
  dynamic recovered;
  dynamic activeCases;
  dynamic critical;
  DateTime updated;

  Cases(
      {@required this.totalCases,
      @required this.todayCases,
      @required this.deaths,
      @required this.todayDeaths,
      @required this.recovered,
      @required this.activeCases,
      @required this.critical,
      @required this.updated});

  factory Cases.fromJson(Map<String, dynamic> parsedJson) {
    return Cases(
            totalCases: parsedJson['cases'],
            todayCases: parsedJson['todayCases'] ?? 0.0,
            deaths: parsedJson['deaths'] ?? 0.0,
            todayDeaths: parsedJson['todayDeaths'] ?? 0.0,
            recovered: parsedJson['recovered'] ?? 0.0,
            activeCases: parsedJson['activeCases'] ?? 0.0,
            updated:
                DateTime.fromMicrosecondsSinceEpoch(parsedJson['updated']) ??
                    DateTime.now().toLocal(),
            critical: parsedJson['critical']) ??
        0.0;
  }
}
