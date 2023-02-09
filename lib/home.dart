import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/service.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(FirebaseAuth.instance.currentUser!.email!),
          Spacer(),
          IconButton(onPressed: (){
            ServiceApp().signOut();
          }, icon: Icon(Icons.logout)),
        ],
      ),
    );
  }
}
