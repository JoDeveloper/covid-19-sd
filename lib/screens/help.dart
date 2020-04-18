import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:undraw/undraw.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/rounded_bordered_container.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.transparent,
          ),
          ListView(
            children: <Widget>[
              UnDraw(
                color: Colors.lightGreen,
                width: 250.0,
                illustration: UnDrawIllustration.doctors,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "خليك في البيت ",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0, bottom: 10.0),
                  child: Text(
                    "طوارئ وزارة الصحة",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              RoundedContainer(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: InkWell(
                    onTap: () => launch("tel:" + Uri.encodeComponent('9090')),
                    child: Text(
                      "9090",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "كل السودان ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: Icon(
                    Icons.phone_in_talk,
                    color: Colors.green,
                  ),
                ),
              ),
              RoundedContainer(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: InkWell(
                    onTap: () => launch("tel:" + Uri.encodeComponent('221')),
                    child: Text(
                      "221",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "ولاية الخرطوم ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: Icon(
                    Icons.phone_in_talk,
                    color: Colors.green,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, right: 30.0, bottom: 10.0),
                  child: Text(
                    "أطباء متطوعون",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              RoundedContainer(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: InkWell(
                    onTap: () =>
                        launch("tel:" + Uri.encodeComponent('+249119570808')),
                    child: Text(
                      "+249119570808",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "د. عبد الخالق رحمة الله",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Icons.phone_in_talk,
                    color: Colors.green,
                  ),
                ),
              ),
              RoundedContainer(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: InkWell(
                    onTap: () =>
                        launch("tel:" + Uri.encodeComponent('+249910000774')),
                    child: Text(
                      "+249910000774",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "د. آمنة الطيب عثمان يوسف",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Icons.phone_in_talk,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                height: 35.0,
              ),
              Center(
                  child: Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Built with "),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Text(" By"),
                    InkWell(
                      child: Text(
                        "  Joseph ",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onTap: null,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
