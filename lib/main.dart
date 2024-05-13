import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:tutorialspoint/Login_Page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String name = user.displayName.toString();
      String email = user.email.toString();
      String image = user.photoURL.toString();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return Log_in_Page(name, email, image);
          },
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true,backgroundColor: Colors.white,elevation: 0,
        title: Text(
          "Google sign In",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
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
                  width: 125,margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.orange.shade300,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(219, 147, 112, 1),
                      padding: const EdgeInsets.all(3),
                      textStyle: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      signInWithGoogle().then((value) {
                        String name, email, image;
                        name = value.user!.displayName.toString();
                        email = value.user!.email.toString();
                        image = value.user!.photoURL.toString();
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Log_in_Page(name, email, image);
                          },
                        ));
                      });
                    },
                    child: Text(
                      "Google Login",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.2,
                          wordSpacing: 0.3,
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
        ],
      ),
    );
  }
}
