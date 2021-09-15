// @dart=2.9
import 'package:flutter/material.dart';
import 'account_page.dart';
// import 'chat_page.dart';
import 'homeTal_page .dart';



class RootTalApp extends StatefulWidget {
    static const id =  '/RootTalApp';
    const RootTalApp({Key key}) : super(key: key);

  @override
  _RootTalAppState createState() => _RootTalAppState();
}

class _RootTalAppState extends State<RootTalApp> {
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
    return IndexedStack(
      index: _activeTab,
      children: [
        HomeTalPage(),
        AccountPage(),
        // ChatPage()
      ],
    );
  }

  
}
