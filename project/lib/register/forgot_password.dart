// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ResetPage extends StatefulWidget {
  static const id =  '/ResetPage';

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  // TextEditingController _email = TextEditingController();
  String email;
  final _auth = FirebaseAuth.instance;

  // bool isLoading = false;

  @override

Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('Reset Password'),
      backgroundColor:  Color(0xff0095FF),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(  
                hintText: 'Email'
              ),
               onChanged: (value) {
                setState(() {
                  email = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text('Send Request'),
                
                onPressed: () {
                  _auth.sendPasswordResetEmail(email: email);
                  Navigator.of(context).pop();
                },

              ),

            ],
          ),

        ],),
    );
  }
}
