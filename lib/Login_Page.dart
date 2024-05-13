import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tutorialspoint/Tutorialspoint.dart';
import 'package:tutorialspoint/main.dart';

class Log_in_Page extends StatefulWidget {
  String name, email, image;

  Log_in_Page(this.name, this.email, this.image);

  @override
  State<Log_in_Page> createState() => _Log_in_PageState();
}

class _Log_in_PageState extends State<Log_in_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text(
          "${widget.name}",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
      ),
      drawer: Drawer(
        width: 250,
        backgroundColor: Colors.grey,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                arrowColor: Colors.grey,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.lime.shade800,
                  Colors.lime.shade200,
                  Colors.lightGreen.shade900
                ])),
                accountName: Text(
                  "${widget.name}",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                accountEmail: Text(
                  "${widget.email}",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("${widget.image}"),
                )),
            Card(
                color: Colors.grey,
                margin: EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(hintText: "${widget.name}"),
                )),
            Card(
                color: Colors.grey,
                margin: EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(hintText: "${widget.email}"),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo[200],
                          padding: const EdgeInsets.all(3),
                          textStyle: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          await GoogleSignIn().signOut();
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            },
                          ));
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 30,wordSpacing: 5,letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ))
                ),
              ],
            )
          ],
        ),
      ),
      body: Stack(
        children: [
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
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.person,
                    size: 60,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lime[800],
                      padding: const EdgeInsets.all(3),
                      textStyle: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return Tutorialspoint();
                        },
                      ));
                    },
                    child: Text(
                      "Tutorialspoint",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 120,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(250),
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
        ],
      ),
    );
  }
}
