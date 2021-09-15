// @dart=2.9
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/chat_page.dart';
import 'account_page.dart';
import 'cart_page.dart';
import 'order_page.dart';
import 'homeCus_page.dart';
// import 'package:provider/provider.dart';
// import 'package:project/firebase/database.dart';
// import 'package:project/firebase/user.dart';

class RootCusApp extends StatefulWidget {
  static const id = '/RootCusApp';
  const RootCusApp({Key key}) : super(key: key);

  @override
  _RootCusAppState createState() => _RootCusAppState();
}

class _RootCusAppState extends State<RootCusApp> {
  int _activeTab = 0;

  Widget build(BuildContext context) {
    //
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _activeTab,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.store),
                label: 'Orders',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: 'cart',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
                backgroundColor: Colors.black),
          ],
          onTap: (index) {
            setState(() {
              _activeTab = index;
            });
          },
        ),
    );
  }

  Widget getBody() {
    // final brews = Provider.of<QuerySnapshot>(context);
    return IndexedStack(
      index: _activeTab,
      children: [
        HomeCusPage(),
        OrderPage(),
        AccountPage(),
        CartPage(),
        ChatPage()
      ],
    );
  }
}
