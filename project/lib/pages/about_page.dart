// @dart=2.9
import 'package:flutter/material.dart';


class AboutPage extends StatefulWidget {
    static const id =  '/AboutPage';
    const AboutPage({Key key}) : super(key: key);
  

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        title: Text("about",style: TextStyle(
       color: Colors.black)),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Text( 'about',
            style: TextStyle(
              fontSize: 40,
              foreground: Paint()
                // ..style = PaintingStyle.stroke
                ..strokeWidth = 6
                ..color = Colors.black,
            ),
          ),
        ]));
  }
}
