import 'dart:async';

import 'package:covidsudan/model/world_cases.dart';

import '../model/cases.dart';
import '../services/covid_case_service.dart';
import 'package:rxdart/rxdart.dart';

class CovidCasesBloc {
  final _cases = BehaviorSubject<Cases>();
  final _casesService = CasesService();
  final _worldCases = BehaviorSubject<WorldCases>();

  CovidCasesBloc() {
    this._getCases();
    const oneSec = const Duration(hours: 1);
    new Timer.periodic(oneSec, (Timer t) => this._getCases());
  }

  Stream<Cases> get cases => _cases.stream;
  Stream<WorldCases> get worldCases => _worldCases.stream;

  Function(Cases) get changeCases => _cases.sink.add;
  Function(WorldCases) get changeWorldCases => _worldCases.sink.add;

  _getCases() async {
    changeCases(await _casesService.getCases());
//    changeWorldCases(await _casesService.getWorldCases());
  }

  dispose() {
    _cases.close();
    _worldCases.close();
  }
}
