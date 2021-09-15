
// @dart=2.9
import 'package:flutter/material.dart';


class HomeTalPage extends StatefulWidget {
    static const id =  '/HomeTalPage';
    const HomeTalPage({Key key}) : super(key: key);
  @override
  _HomeTalPageState createState() => _HomeTalPageState();
}

class _HomeTalPageState extends State<HomeTalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
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
