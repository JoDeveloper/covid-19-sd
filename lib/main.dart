import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cases/provider.dart';
import 'screens/CasesScreen.dart';
import 'screens/help.dart';
import 'screens/home.dart';
import 'screens/questions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Sudan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.tajawal().fontFamily,
        primarySwatch: Colors.grey,
      ),
      home: Provider(create: (context) => CasesProivder(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomePage _homePage = new HomePage();
  final Questions _questions = new Questions();
  final CasesScreen _cases = new CasesScreen();
  final Info _info = new Info();

  Widget _showPage = new HomePage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 3:
        return _homePage;
        break;
      case 2:
        return _questions;
        break;
      case 1:
        return _cases;
        break;
      case 0:
        return _info;
        break;
      default:
        return new Container(
          color: Colors.grey,
          child: const Center(
            child: ListTile(
              title: const Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 50,
              ),
              subtitle: const Text(
                "\nEmpty Page",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 3,
        height: 60.0,
        items: const <Widget>[
          Icon(
            Icons.live_help,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            FontAwesome.user_md,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.help_outline,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.black,
          ),
        ],
        color: Colors.transparent.withGreen(10),
        buttonBackgroundColor: Colors.transparent.withGreen(10),
        backgroundColor: Colors.transparent.withGreen(10),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (int index) {
          setState(() {
            _showPage = _pageChooser(index);
          });
        },
      ),
      body: _showPage,
    );
  }
}

class MyLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[400],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              Text(
                "\nLoading..",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
