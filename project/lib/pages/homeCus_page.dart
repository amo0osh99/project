
// @dart=2.9
import 'package:flutter/material.dart';
// import 'package:project/pages/chat_page.dart';
// import 'Add-design.dart';
// import 'account_page.dart';
// import 'ready_design.dart';


class HomeCusPage extends StatefulWidget {
    static const id =  '/HomeCusPage';
    const HomeCusPage({Key key}) : super(key: key);
  @override
  _HomeCusPageState createState() => _HomeCusPageState();
}

class _HomeCusPageState extends State<HomeCusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        title: Text("Home Page"),
        backgroundColor: Colors.yellow[900],
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     size: 20,
        //     color: Colors.white,
        //   ),
        // ),
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
