


import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tutorialspoint/Tutorialspoint_web.dart';
import 'package:tutorialspoint/main.dart';



class Tutorialspoint extends StatefulWidget {
  const Tutorialspoint({Key? key}) : super(key: key);

  @override
  State<Tutorialspoint> createState() => _TutorialspointState();
}

class _TutorialspointState extends State<Tutorialspoint> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      PreferredSize(child:  AppBar(centerTitle: true,
        title: const Text(
          "Tutorialspoint",
          style: TextStyle(fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),leading: IconButton(color: Colors.white,
              onPressed: () async {
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return Home();
                  },
                ));
              },
              icon: Icon(Icons.logout,color: Colors.black)
          ),
        backgroundColor: Colors.grey.shade300
      ), preferredSize: Size(0, 50)),

      body:  Stack(children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 120,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(250),
                ),
                color: Colors.indigo[200]),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 120,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(250),
                ),
                color: Colors.indigo[200]),
          ),
        ),

        Center(
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            child:  MaterialButton(
              shape: Border.all(color: Colors.black,width: 5),
              color: Colors.indigo[200],
              onPressed: () {
                setState(() {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Tutorialspoint_web(),
                      settings: const RouteSettings(
                        arguments: "https://www.tutorialspoint.com/index.htm",
                      ),
                    ),
                  );
                });
              },
              child: const Text(
                "Tutorialspoint Web",
                style: TextStyle(color: Colors.white,
                  letterSpacing: 0.5,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),

          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 120,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight:  Radius.circular(250),
                ),
                color: Colors.indigo[200]),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 120,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(250),
                ),
                color: Colors.indigo[200]),
          ),
        ),




      ],),

    );
  }
}
