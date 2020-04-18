import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String title;
  final Icon icon;
  final Color color;
  final Color bgColor;
  final int number;
  final Color titleColor;
  final Function onPressed;

  InfoBox({
    @required this.title,
    @required this.number,
    @required this.color,
    @required this.bgColor,
    @required this.icon,
    @required this.titleColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: bgColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: color,
                        child: icon,
                      ),
                      SizedBox(width: 25.0),
                      number == null
                          ? CircularProgressIndicator()
                          : Text(
                              '$number',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 13,
                              color: titleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
