class WorldCases {
  final String confirmed;
  final String deaths;
  final String recovered;

  WorldCases({
    this.confirmed,
    this.deaths,
    this.recovered,
  });

  factory WorldCases.fromJson(Map<dynamic, dynamic> paresJson) {
    return WorldCases(
      confirmed: paresJson['confirmed'].toString(),
      deaths: paresJson['deaths'].toString(),
      recovered: paresJson['recovered'].toString(),
    );
  }
}
