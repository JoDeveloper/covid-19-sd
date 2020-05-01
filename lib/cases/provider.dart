import '../cases/covid_bloc.dart';

class CasesProivder {
  final _bloc = CovidCasesBloc();
  CovidCasesBloc get bloc => _bloc;
}
