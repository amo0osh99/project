
// @dart=2.9
import 'package:flutter/material.dart';



class HomeDelPage extends StatefulWidget {
    static const id =  '/HomeDelPage';
    const HomeDelPage({Key key}) : super(key: key);
  @override
  _HomeDelPageState createState() => _HomeDelPageState();
}

class _HomeDelPageState extends State<HomeDelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        title: Text("Home Page"),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
       backgroundColor: Colors.white,
    );
  }
}
