import 'dart:async';

import 'package:covidsudan/model/cities.dart';
import 'package:rxdart/rxdart.dart';

import '../model/cases.dart';
import '../services/covid_case_service.dart';

class CovidCasesBloc {
  final _cases = BehaviorSubject<Cases>();
  final _casesService = CasesService();
  final _citiesCases = BehaviorSubject<List<Cities>>();

  CovidCasesBloc() {
    this._getCases();
    const oneSec = const Duration(hours: 1);
    new Timer.periodic(oneSec, (Timer t) => this._getCases());
  }

  Stream<Cases> get cases => _cases.stream;
  Stream<List<Cities>> get citiesCases => _citiesCases.stream;

  Function(Cases) get changeCases => _cases.sink.add;
  Function(List<Cities>) get changeCitiesCases => _citiesCases.sink.add;

  _getCases() async {
    changeCases(await _casesService.getCases());
    changeCitiesCases(await _casesService.getCitiesCases());
  }

  dispose() {
    _cases.close();
    _citiesCases.close();
  }
}
