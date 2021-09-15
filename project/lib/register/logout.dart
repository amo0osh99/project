// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/firebase/auth.dart';
import 'package:provider/provider.dart';

class LogOut extends StatelessWidget {

  final AuthServise _auth = AuthServise();
  final email = TextEditingController();
  final password = TextEditingController();
  // static const id = '/LoginScreen';
  final auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
  // User user = FirebaseAuth.instance.currentUser;
  //   String errorMessage = '';
      final authServise = Provider.of<AuthServise>(context);
    return Scaffold(
      body: Center(
        child: TextButton(
            child: isLoading? CircularProgressIndicator(color: Colors.blue):Text('Logout'),
            onPressed: () async {
              await authServise.signOut();
            },
            ),
      ),
    );
  }

 
}

void setState(Null Function() param0) {
}
