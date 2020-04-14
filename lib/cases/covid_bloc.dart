import 'dart:async';

import '../model/cases.dart';
import '../services/covid_case_service.dart';
import 'package:rxdart/rxdart.dart';

class CovidCasesBloc {
  final _cases = BehaviorSubject<Cases>();
  final _casesService = CasesService();

  CovidCasesBloc() {
    this._getCases();
    const oneSec = const Duration(hours: 1);
    new Timer.periodic(oneSec, (Timer t) => this._getCases());
  }

  Stream<Cases> get cases => _cases.stream;

  Function(Cases) get changeCases => _cases.sink.add;

  _getCases() async {
    changeCases(await _casesService.getCases());
  }

  dispose() {
    _cases.close();
  }
}
