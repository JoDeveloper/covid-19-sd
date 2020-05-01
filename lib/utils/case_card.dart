import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

import '../utils/colors.dart';


class CaseCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color iconColor;

  const CaseCard(
      {Key key, this.title, this.subTitle, this.icon, this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return Container(
      height: hp(13),
      width: wp(100),
      padding: EdgeInsets.all(20),
      //margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: LightColor.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          new BoxShadow(
              color: Colors.grey[100],
              blurRadius: 4.0,
              spreadRadius: 3.5,
              offset: Offset(0.0, 2)),
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      icon,
                      size: 50,
                      color: iconColor,
                    ),
                    SizedBox(width: wp(5)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title,
                            style:TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        SizedBox(height: hp(1)),
                        Text(subTitle,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 16))
                      ],
                    )
                  ]),
            )
          ]),
    );
  }
}
