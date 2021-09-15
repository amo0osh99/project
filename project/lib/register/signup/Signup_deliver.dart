// @dart=2.9


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project/firebase/auth.dart';
import 'package:project/firebase/user.dart';
import 'package:project/pages/rootDel_app%20.dart';
import 'package:project/register/log_in.dart';
import 'package:provider/provider.dart';



class SignupDeliverPage extends StatefulWidget {
    static const id =  '/SignupDeliverPage';
  @override
  _SignupDeliverPageState createState() => _SignupDeliverPageState();
}

class _SignupDeliverPageState extends State<SignupDeliverPage> {

  String email;
  String name;
  String phoneNumber;
  String passWord;
  String locationCity;

  final formKey = GlobalKey<FormState>();

  bool visible = false;

  void toggle() {
    setState(() {
      visible = !visible;
    });
  }
  @override
  Widget build(BuildContext context) {

    final authServise = Provider.of<AuthServise>(context);
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController name = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up Deliver",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account, It's free ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  TextFormField(
                    controller: name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Name cannot be empty';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.black),
                        border: OutlineInputBorder(),
                        hintText: 'Name'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email cannot be empty';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        border: OutlineInputBorder(),
                        hintText: 'Email'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password cannot be empty';
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                          border: OutlineInputBorder(),
                          hintText: 'password'),
                      obscureText: true),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: _signUp,
                  // onPressed: ()async {
                  //   await authServise.ceateUserWithEmailAndPassword(
                  //     email.text,
                  //     password.text,
                  //     name.text,
                  //   );
                  //   Navigator.pop(context);
                  // },
                  
                  color: Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  TextButton(
                    child: Text(
                      'LogIn',
                      style: TextStyle(color: Colors.black, height: 1.0),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => LoginPage()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void _signUp() async {
    if (formKey.currentState.validate()) {
      try {
        UserModel newUser;
        newUser = UserModel(
          name: name,
          email: email,
          password: passWord,
          location: "not available",
          type: "Deliver",
          phone: "Not available",
        );
        toggle();

        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: passWord);
        if (userCredential != null) {
          toggle();
          newUser.id = FirebaseAuth.instance.currentUser.uid;
          var set = FirebaseDatabase.instance
              .reference()
              .child('users')
              .child(userCredential.user.uid)
              .set(<String, Object>{
            "email": newUser.email,
            "password": newUser.password,
            "type": newUser.type,
            "id": newUser.id,
            "phone": newUser.phone,
            "name": newUser.name,
            "state": newUser.state,
            "location": newUser.location,
          }).then((value) {
            toggle();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) {
              return RootDelApp();
            }));
          }).catchError((error, stackTrace) {
            toggle();
            print('error');
            print(error.toString());
            final snackBar = SnackBar(content: Text(error.toString()));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        } else {
          toggle();
          final snackBar = SnackBar(content: Text('error '));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        toggle();
        var ex = e as FirebaseAuthException;
        final snackBar = SnackBar(content: Text(ex.message));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}


String validateEmail(String formEmail) {
  if (formEmail == null || formEmail.isEmpty)
    return 'E-mail address is required.';

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail address formt';

  return null;
}

String validatePassword(String formPassword) {
  if (formPassword == null || formPassword.isEmpty)
    return 'Password is required.';

  return null;
}
