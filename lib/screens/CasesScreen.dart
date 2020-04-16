import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import '../cases/provider.dart';
import '../model/cases.dart';
import '../utils/info_box.dart';

class CasesScreen extends StatelessWidget {
  final Map<String, double> dataMap = new Map();

  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<CasesProivder>(context).bloc;
    const List<Color> colorList = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
    ];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.lightGreen[700],
            child: ListView(
              children: <Widget>[
                StreamBuilder<Cases>(
                    stream: cases.cases,
                    builder: (context, snapshot) {
                      dataMap.putIfAbsent(
                          "todayCases", () => snapshot.data.todayCases);
                      dataMap.putIfAbsent(
                          "critical", () => snapshot.data.critical);
                      dataMap.putIfAbsent(
                          "todayDeaths", () => snapshot.data.todayDeaths);
                      dataMap.putIfAbsent(
                          "totalCases", () => snapshot.data.totalCases);
                      return snapshot.hasData
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: <Widget>[
                                  Container(
                                    width: 200.0,
                                    height: 200.0,
                                    margin: const EdgeInsets.all(8.0),
                                    child: PieChart(
                                      dataMap: dataMap,
                                      animationDuration:
                                          Duration(milliseconds: 800),
                                      chartLegendSpacing: 32.0,
                                      chartRadius:
                                          MediaQuery.of(context).size.width /
                                              2.7,
                                      showChartValuesInPercentage: true,
                                      showChartValues: true,
                                      showChartValuesOutside: false,
                                      chartValueBackgroundColor:
                                          Colors.grey[200],
                                      colorList: colorList,
                                      showLegends: true,
                                      legendPosition: LegendPosition.right,
                                      decimalPlaces: 1,
                                      showChartValueLabel: true,
                                      initialAngle: 0,
                                      chartValueStyle:
                                          defaultChartValueStyle.copyWith(
                                        color: Colors.blueGrey[900]
                                            .withOpacity(0.9),
                                      ),
                                      chartType: ChartType.disc,
                                    ),
                                  ),
                                  const SizedBox(height: 25.0),
                                  Row(
                                    children: <Widget>[
                                      InfoBox(
                                        titleColor: Colors.black,
                                        bgColor: Colors.white70,
                                        title: 'الحالات المصابة اليوم ',
                                        number: snapshot.data.todayCases,
                                        color: Colors.blue,
                                        icon: Icon(Icons.calendar_today,
                                            color: Colors.white, size: 25),
                                      ),
                                      const SizedBox(width: 15.0),
                                      InfoBox(
                                        titleColor: Colors.black,
                                        bgColor: Colors.red[50],
                                        title: 'إجمالي حالات الإصابة',
                                        number: snapshot.data.totalCases,
                                        color: Colors.blue,
                                        icon: Icon(FontAwesome.bed,
                                            color: Colors.white, size: 25),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 25.0),
                                  Row(
                                    children: <Widget>[
                                      InfoBox(
                                        titleColor: Colors.black,
                                        bgColor: Colors.green[700],
                                        title: 'حالات شَفيت',
                                        number: snapshot.data.recovered,
                                        color: Colors.green,
                                        icon: Icon(FontAwesome.check_circle_o,
                                            color: Colors.white, size: 25),
                                      ),
                                      const SizedBox(width: 15.0),
                                      InfoBox(
                                        titleColor: Colors.black,
                                        bgColor: Colors.amberAccent,
                                        title: 'تحت الرعاية الطبية',
                                        number: snapshot.data.activeCases,
                                        color: Colors.green,
                                        icon: Icon(Icons.mood,
                                            color: Colors.white, size: 25),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 25.0),
                                  Row(
                                    children: <Widget>[
                                      InfoBox(
                                        titleColor: Colors.white,
                                        bgColor: Colors.redAccent[700],
                                        title: 'وفيات اليوم',
                                        number: snapshot.data.todayDeaths,
                                        color: Colors.orange,
                                        icon: Icon(Icons.person_pin,
                                            color: Colors.white, size: 25),
                                      ),
                                      const SizedBox(width: 15.0),
                                      InfoBox(
                                        titleColor: Colors.white,
                                        bgColor: Colors.redAccent[700],
                                        title: 'إجمالي الوفيات',
                                        number: snapshot.data.deaths,
                                        color: Colors.orange,
                                        icon: Icon(Icons.linear_scale,
                                            color: Colors.white, size: 25),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
