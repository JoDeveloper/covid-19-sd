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
    final String totalCases = "إجمالي حالات الإصابة";
    final String deaths = "إجمالي الوفيات";
    final String recovered = "حالات شَفيت";
    final String activeCases = "تحت الرعاية الطبية";
    final List<Color> listColors = [
      Colors.red[50],
      Colors.red[400],
      Colors.green[700],
      Colors.amberAccent
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.grey,
            child: ListView(
              children: <Widget>[
                StreamBuilder<Cases>(
                    stream: cases.cases,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        dataMap.putIfAbsent(
                            "$totalCases", () => snapshot.data.totalCases + .0);
                        dataMap.putIfAbsent(
                            "$deaths", () => snapshot.data.deaths + .0);
                        dataMap.putIfAbsent(
                            "$recovered", () => snapshot.data.recovered + .0);
                        dataMap.putIfAbsent("$activeCases",
                            () => snapshot.data.activeCases + .0);
                      }
                      return snapshot.hasData
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: <Widget>[
                                  const SizedBox(height: 25.0),
                                  Container(
                                    width: 200.0,
                                    height: 200.0,
                                    margin: const EdgeInsets.all(8.0),
                                    child: PieChart(
                                      dataMap: dataMap,
                                      animationDuration:
                                          Duration(milliseconds: 5000),
                                      colorList: listColors,
                                    ),
                                  ),
                                  const SizedBox(height: 25.0),
                                  Row(
                                    children: <Widget>[
                                      InfoBox(
                                        titleColor: Colors.white,
                                        bgColor: Colors.red[400],
                                        title: '$deaths',
                                        number: snapshot.data.deaths,
                                        color: Colors.red[100],
                                        icon: Icon(Icons.linear_scale,
                                            color: Colors.white, size: 25),
                                      ),
                                      const SizedBox(width: 15.0),
                                      InfoBox(
                                        titleColor: Colors.black,
                                        bgColor: Colors.red[50],
                                        title: '$totalCases',
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
                                        title: '$recovered',
                                        number: snapshot.data.recovered,
                                        color: Colors.green,
                                        icon: Icon(FontAwesome.check_circle_o,
                                            color: Colors.white, size: 25),
                                      ),
                                      const SizedBox(width: 15.0),
                                      InfoBox(
                                        titleColor: Colors.black,
                                        bgColor: Colors.amberAccent,
                                        title: '$activeCases',
                                        number: snapshot.data.activeCases,
                                        color: Colors.green,
                                        icon: Icon(Icons.mood,
                                            color: Colors.white, size: 25),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 25.0),
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
