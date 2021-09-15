// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/order_page.dart';
import 'package:project/pages/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:project/firebase/auth.dart';
import 'package:project/register/log_in.dart';
import 'package:project/pages/rootCus_app.dart';
import 'package:project/register/signup/Signup_customer.dart';
import 'pages/about_page.dart';
import 'pages/account_page.dart';
import 'pages/cart_page.dart';
import 'pages/homeCus_page.dart';
import 'pages/homeDel_page .dart';
import 'pages/homeTal_page .dart';
import 'pages/rootDel_app .dart';
import 'pages/rootTal_app .dart';
import 'register/forgot_password.dart';
import 'register/signup/Signup_deliver.dart';
import 'register/signup/Signup_tailor.dart';
import 'register/signup/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthServise>(
          create: (_) => AuthServise(),
        ),
      ],
      child: MaterialApp(
        initialRoute: LoginPage.id,
        routes: {
          SplashScreen.id: (ctx) => SplashScreen(),
          LoginPage.id: (ctx) => LoginPage(),
          RootCusApp.id: (ctx) => RootCusApp(),
          AboutPage.id: (ctx) => AboutPage(),
          AccountPage.id: (ctx) => AccountPage(),
          CartPage.id: (ctx) => CartPage(),
          OrderPage.id: (ctx) => OrderPage(),
          HomeCusPage.id: (ctx) => HomeCusPage(),
          HomeDelPage.id: (ctx) => HomeDelPage(),
          HomeTalPage.id: (ctx) => HomeTalPage(),
          RootDelApp.id: (ctx) => RootDelApp(),
          RootTalApp.id: (ctx) => RootTalApp(),
          SignupCusPage.id: (ctx) => SignupCusPage(),
          SignupDeliverPage.id: (ctx) => SignupDeliverPage(),
          SignupTaliorPage.id: (ctx) => SignupTaliorPage(),
          SignupPage.id: (ctx) => SignupPage(),
          ResetPage.id: (ctx) => ResetPage(),


        },
      ),
    );
  }
}
