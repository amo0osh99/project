// @dart=2.9
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:project/register/log_in.dart';



class SplashScreen extends StatefulWidget {
    static const id =  '/SplashScreen';
    const SplashScreen({Key key}) : super(key: key);
@override
_SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
void initState() {
super.initState();
Timer(
      Duration(seconds: 5),
      () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(
                // title: '',
                ),
          )),
    );
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color(0xff622f74),
              gradient: LinearGradient(
                colors: [new Color(0xff0F2027), new Color(0xff203A43)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 75.0,
                child: Icon(
                  Icons.emoji_events,
                  color: new Color(0xff0F2027),
                  size: 50.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
            ],
          ),
        ],
      ),
    );
}
}



