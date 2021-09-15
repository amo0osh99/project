// @dart=2.9


import 'package:flutter/material.dart';
import 'package:project/firebase/auth.dart';
import 'package:project/firebase/user.dart';
import 'package:project/pages/rootCus_app.dart';
import 'package:project/register/log_in.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authServise = Provider.of<AuthServise>(context);

  return StreamBuilder<User>(
    stream: authServise.user,
    builder: (_, AsyncSnapshot<User> snapshot){
      if(snapshot.connectionState == ConnectionState.active){
        final User user = snapshot.data;
        return user == null ? LoginPage() : RootCusApp();
      }else{
        return Scaffold(body: Center(child:CircularProgressIndicator(),),);
      }
    });
  }
}
