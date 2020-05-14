import 'package:covidsudan/model/cities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';

import '../cases/provider.dart';
import '../model/cases.dart';
import '../utils/info_box.dart';

class CasesScreen extends StatefulWidget {
  @override
  _CasesScreenState createState() => _CasesScreenState();
}

class _CasesScreenState extends State<CasesScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
  Duration _duration = Duration(milliseconds: 500);
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _duration);
    super.initState();
  }

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
      Colors.green,
      Colors.blue
    ];
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: hp(76),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 35.0),
                StreamBuilder<Cases>(
                    stream: cases.cases,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        dataMap.putIfAbsent(
                            "$deaths",
                            () =>
                                snapshot.data.deaths +
                                .0 / snapshot.data.totalCases +
                                .0);
                        dataMap.putIfAbsent(
                            "$recovered",
                            () =>
                                snapshot.data.recovered +
                                .0 / snapshot.data.totalCases +
                                .0);
                        dataMap.putIfAbsent(
                            "$activeCases",
                            () =>
                                snapshot.data.activeCases +
                                .0 / snapshot.data.totalCases +
                                .0);
                      }
                      return snapshot.hasData
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  // const SizedBox(height: 25.0),
                                  Container(
                                    width: wp(90),
                                    height: hp(25),
                                    margin: const EdgeInsets.all(8.0),
                                    child: PieChart(
                                      dataMap: dataMap,
                                      legendPosition: LegendPosition.right,
                                      chartValueStyle:
                                          TextStyle(color: Colors.white),
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
              ],
            ),
          ),
          // SizedBox(height: hp(2)),
          SizedBox.expand(
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                  child: SlideTransition(
                    position: _tween.animate(_controller),
                    child: DraggableScrollableSheet(
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return Container(
                          color: Colors.blueGrey,
                          child: StreamBuilder<List<Cities>>(
                              stream: cases.citiesCases,
                              builder: (context, snapshot) {
                                return snapshot.hasData
                                    ? ListView.separated(
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                Divider(
                                          thickness: 2.0,
                                        ),
                                        controller: scrollController,
                                        itemCount: snapshot.data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            trailing: Text(
                                              snapshot.data[index].city,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            title: Text(
                                              snapshot.data[index].confirmed,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          );
                                        },
                                      )
                                    : Center();
                              }),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        child: FloatingActionButton(
          child: AnimatedIcon(
              icon: AnimatedIcons.home_menu, progress: _controller),
          elevation: 5,
          backgroundColor: Colors.white54,
          foregroundColor: Colors.white,
          onPressed: () async {
            if (_controller.isDismissed)
              _controller.forward();
            else if (_controller.isCompleted) _controller.reverse();
          },
        ),
      ),
    );
  }
}
