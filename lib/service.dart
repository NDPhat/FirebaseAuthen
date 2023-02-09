import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/home.dart';
import 'package:untitled/login.dart';

class ServiceApp {
  //1.handle
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context,snapshot){
        if(snapshot.hasData)
          {
              return const Homepage();
          }
        return const LoginPage();
    });
  }
  signInWithGG() async {
    final GoogleSignInAccount ? acc=await GoogleSignIn(
      scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication ggAuth=await acc!.authentication;
    final creden=GoogleAuthProvider.credential(
      accessToken: ggAuth.accessToken,idToken: ggAuth.idToken
    );
    return await FirebaseAuth.instance.signInWithCredential(creden);

  }
  signOut(){
    FirebaseAuth.instance.signOut();
  }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }



}
