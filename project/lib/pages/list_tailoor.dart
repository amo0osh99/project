// @dart=2.9

// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/Add-design.dart';
import 'package:project/pages/account_page.dart';
import 'package:project/pages/chat_page.dart';
import 'package:project/pages/ready_design.dart';


class TailorMainPage extends StatefulWidget {
  @override
  _TailorMainPageState createState() => _TailorMainPageState();
}

class _TailorMainPageState extends State<TailorMainPage> {
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
       body: Center(
         child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [ InkWell(
          onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c) => ChatPage()));
      },
          child: Container(height: 50,
          width: 150,
          decoration: BoxDecoration(boxShadow: [BoxShadow(offset:Offset( 0.0,20.0),
          blurRadius: 30.0,color: Colors.black)
          ],color: Colors.white,borderRadius: BorderRadius.circular(22.0)),
          child: Row(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 110.0,
                padding: EdgeInsets.symmetric(vertical: 12.0,horizontal:12.0),
                child: Text("chat",style: Theme.of(context).textTheme.button.apply(color: Colors.black),),
              decoration: BoxDecoration(color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(95.0),
                topLeft:Radius.circular(95.0),
                bottomRight: Radius.circular(200.0) )),),
                 Icon(Icons.chat,size: 30.0)
            ],
          ),
          ),
        ),    
        SizedBox(
              height: 30,
            ),
        InkWell(
          onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c) => AccountPage()));
      },
          child: Container(height: 50,
          width: 150,
          decoration: BoxDecoration(boxShadow: [BoxShadow(offset:Offset( 0.0,20.0),
          blurRadius: 30.0,color: Colors.black)
          ],color: Colors.white,borderRadius: BorderRadius.circular(22.0)),
          child: Row(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 110.0,
                padding: EdgeInsets.symmetric(vertical: 12.0,horizontal:12.0),
                child: Text("Profile",style: Theme.of(context).textTheme.button.apply(color: Colors.black),),
              decoration: BoxDecoration(color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(95.0),
                topLeft:Radius.circular(95.0),
                bottomRight: Radius.circular(200.0) )),),
                 Icon(Icons.person,size: 30.0)
            ],
          ),
          ),
        ),    
        SizedBox(
              height: 30,
            ),
        InkWell(
      //     onTap: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (c) => CommentPage()));
      // },
          child: Container(height: 50,
          width: 150,
          decoration: BoxDecoration(boxShadow: [BoxShadow(offset:Offset( 0.0,20.0),
          blurRadius: 30.0,color: Colors.black)
          ],color: Colors.white,borderRadius: BorderRadius.circular(22.0)),
          child: Row(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 110.0,
                padding: EdgeInsets.symmetric(vertical: 12.0,horizontal:12.0),
                child: Text("Comment",style: Theme.of(context).textTheme.button.apply(color: Colors.black),),
              decoration: BoxDecoration(color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(95.0),
                topLeft:Radius.circular(95.0),
                bottomRight: Radius.circular(200.0) )),),
                 Icon(Icons.comment,size: 30.0)
            ],
          ),
          ),
        ),    

        SizedBox(
              height:30,
            ),    

        InkWell(
          onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c) => AddDPage()));
      },
          child: Container(height: 50,
          width: 150,
          decoration: BoxDecoration(boxShadow: [BoxShadow(offset:Offset( 0.0,20.0),
          blurRadius: 30.0,color: Colors.black)
          ],color: Colors.white,borderRadius: BorderRadius.circular(22.0)),
          child: Row(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 110.0,
                padding: EdgeInsets.symmetric(vertical: 12.0,horizontal:12.0),
                child: Text("Add",style: Theme.of(context).textTheme.button.apply(color: Colors.black),),
              decoration: BoxDecoration(color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(95.0),
                topLeft:Radius.circular(95.0),
                bottomRight: Radius.circular(200.0) )),),
                 Icon(Icons.add,size: 30.0)
            ],
          ),
          ),
        ),
        SizedBox(
              height:30,
            ),    

        InkWell(
          onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c) => ReadyDPage()));
      },
          child: Container(height: 50,
          width: 150,
          decoration: BoxDecoration(boxShadow: [BoxShadow(offset:Offset( 0.0,20.0),
          blurRadius: 30.0,color: Colors.black)
          ],color: Colors.white,borderRadius: BorderRadius.circular(22.0)),
          child: Row(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 110.0,
                padding: EdgeInsets.symmetric(vertical: 12.0,horizontal:12.0),
                child: Text("ready",style: Theme.of(context).textTheme.button.apply(color: Colors.black),),
              decoration: BoxDecoration(color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(95.0),
                topLeft:Radius.circular(95.0),
                bottomRight: Radius.circular(200.0) )),),
                 Icon(Icons.open_in_browser,size: 30.0)
            ],
          ),
          ),
        ),
       SizedBox(
              height:30,
            ),    

        InkWell(
          onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c) => ReadyDPage()));
      },
          child: Container(height: 50,
          width: 150,
          decoration: BoxDecoration(boxShadow: [BoxShadow(offset:Offset( 0.0,20.0),
          blurRadius: 30.0,color: Colors.black)
          ],color: Colors.white,borderRadius: BorderRadius.circular(22.0)),
          child: Row(
            children: <Widget>[
              Container(
                height: 50.0,
                width: 110.0,
                padding: EdgeInsets.symmetric(vertical: 12.0,horizontal:12.0),
                child: Text("modify",style: Theme.of(context).textTheme.button.apply(color: Colors.black),),
              decoration: BoxDecoration(color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(95.0),
                topLeft:Radius.circular(95.0),
                bottomRight: Radius.circular(200.0) )),),
                 Icon(Icons.open_in_browser,size: 30.0)
            ],
          ),
          ),
        ),
       
           ] ),
       
     ) );
  }
}
