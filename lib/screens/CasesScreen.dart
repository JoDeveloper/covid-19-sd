import 'package:covidsudan/model/world_cases.dart';
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
      Colors.blueGrey[800],
      Colors.red,
      Colors.green,
      Colors.blue
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 35.0),
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
                                      chartValueBackgroundColor: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 25.0),
                                  Row(
                                    children: <Widget>[
                                      InfoBox(
                                        titleColor: Colors.white,
                                        bgColor: Colors.blueGrey[800],
                                        title: '$deaths',
                                        number: snapshot.data.deaths,
                                        color: Colors.white,
                                        icon: Icon(Icons.linear_scale,
                                            color: Colors.blueGrey[800],
                                            size: 25),
                                      ),
                                      const SizedBox(width: 15.0),
                                      InfoBox(
                                        titleColor: Colors.white,
                                        bgColor: Colors.red,
                                        title: '$totalCases',
                                        number: snapshot.data.totalCases,
                                        color: Colors.white,
                                        icon: Icon(FontAwesome.bed,
                                            color: Colors.red, size: 25),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 25.0),
                                  Row(
                                    children: <Widget>[
                                      InfoBox(
                                        titleColor: Colors.white,
                                        bgColor: Colors.green,
                                        title: '$recovered',
                                        number: snapshot.data.recovered,
                                        color: Colors.white,
                                        icon: Icon(FontAwesome.check_circle_o,
                                            color: Colors.green, size: 25),
                                      ),
                                      const SizedBox(width: 15.0),
                                      InfoBox(
                                        titleColor: Colors.white,
                                        bgColor: Colors.blue,
                                        title: '$activeCases',
                                        number: snapshot.data.activeCases,
                                        color: Colors.white,
                                        icon: Icon(Icons.mood,
                                            color: Colors.blue, size: 25),
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
                const SizedBox(height: 25.0),
//                const SizedBox(height: 25.0),
//                StreamBuilder<WorldCases>(
//                  stream: cases.worldCases,
//                  builder: (_, snapshot) {
//                    return snapshot.hasData
//                        ? Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: ListTile(
//                              contentPadding: EdgeInsets.symmetric(
//                                  horizontal: 20.0, vertical: 10.0),
//                              leading: Container(
//                                padding: EdgeInsets.only(right: 12.0),
//                                decoration: new BoxDecoration(
//                                    border: new Border(
//                                        right: new BorderSide(
//                                            width: 1.0,
//                                            color: Colors.blueGrey[900]))),
//                                child: Icon(Icons.linear_scale,
//                                    color: Colors.blueGrey[900]),
//                              ),
//                              title: Align(
//                                alignment: Alignment.center,
//                                child: Text(
//                                  "Introduction to Driving",
//                                  style: TextStyle(
//                                      color: Colors.blueGrey[900],
//                                      fontWeight: FontWeight.bold),
//                                ),
//                              ),
//                              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
//
//                              subtitle: Row(
//                                children: <Widget>[
//                                  Text(" Intermediate",
//                                      style: TextStyle(
//                                          color: Colors.blueGrey[900]))
//                                ],
//                              ),
//                            ),
//                          )
//                        : Center();
//                  },
//                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
