import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/covidData.dart';

class Questions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.transparent,
          ),
          ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return questions[index];
              })
        ],
      ),
    );
  }
}
