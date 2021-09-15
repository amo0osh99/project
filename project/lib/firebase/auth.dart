// @dart=2.9


import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:project/firebase/database.dart';
import 'package:project/firebase/user.dart';

class AuthServise {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User _userFromFirebaseUser(auth.User user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  // auth change user stream
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebaseUser);
  }

//   // sign in anon
//   Future signInAnon() async {
//     try {
//       UserCredential result = await _auth.signInAnonymously();
//       User user = result.user;
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebaseUser(credential.user);
  }

  //Register  with email and password
  Future ceateUserWithEmailAndPassword(String name ,String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
       email: email, password: password);
    return _userFromFirebaseUser(credential.user);
  }

//   //sign out

  Future signOut() async {
    return await _firebaseAuth.signOut();
  }
}
