// @dart=2.9
import 'package:flutter/material.dart';
import 'account_page.dart';
// import 'chat_page.dart';
import 'homeDel_page .dart';



class RootDelApp extends StatefulWidget {
    static const id =  '/RootDelApp';
    const RootDelApp({Key key}) : super(key: key);
  @override
  _RootDelAppState createState() => _RootDelAppState();
}

class _RootDelAppState extends State<RootDelApp> {
  int _activeTab = 0;

  Widget build(BuildContext context) {
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
              icon: Icon(Icons.person),
              label: 'Account',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'chat',
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
    return IndexedStack(
      index: _activeTab,
      children: [
        HomeDelPage(),
        AccountPage(),
        // ChatPage()
      ],
    );
  }

  
}
