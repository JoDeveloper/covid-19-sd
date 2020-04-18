import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:undraw/undraw.dart';
import 'package:video_player/video_player.dart';

import '../utils/covidData.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
//    https://www.youtube.com/watch?v=VC8v-uo9RiY
//    _controller = VideoPlayerController.asset('images/corona.mp4')
//      ..initialize().then((_) {
//        _controller.setLooping(true);
//        Timer.periodic(Duration(seconds: 30), (Timer t) {
//          _controller.play();
//        });
//        setState(() {});
//      });
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.transparent,
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

//                  Center(
//                    child: _controller.value.initialized
//                        ? Container(
//                            width: wp(95),
//                            height: hp(40),
//                            child: AspectRatio(
//                              aspectRatio: _controller.value.aspectRatio,
//                              child: VideoPlayer(_controller),
//                            ),
//                          )
//                        : Center(child: CircularProgressIndicator()),
//                  ),
//                  const SizedBox(
//                    height: 20.0,
//                  ),
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

  @override
  void dispose() {
//    _controller.dispose();
    super.dispose();
  }
}
