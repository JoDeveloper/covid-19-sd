import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:undraw/undraw.dart';

import '../utils/covidData.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        ListView(
          children: <Widget>[
            UnDraw(
              color: Colors.lightGreen,
              illustration: UnDrawIllustration.doctor,
              height: hp(20),
              errorWidget: Center(),
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 10, right: 50),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  title: Text(
                    "مرحبا",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "كيف تشعر اليوم ؟",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: wp(150),
              height: hp(100),
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 20.0,
                  ),
                  CarouselSlider(
                    autoPlayInterval: Duration(seconds: 10),
//                    viewportFraction: 0.9,
                    aspectRatio: 4/2,

                    autoPlay: true,
                    enlargeCenterPage: true,
                    items: covidList.map(
                      (url) {
                        return Container(
                          margin: EdgeInsets.all(3.0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Image.asset(url,
                                fit: BoxFit.fill, width: wp(450.0)),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

}
