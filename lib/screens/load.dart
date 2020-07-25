import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './places.dart';

class FlutterSpinkit extends StatefulWidget {
  FlutterSpinkit({this.user, this.googleSignIn});
  final FirebaseUser user;
  final GoogleSignIn googleSignIn;
  @override
  _FlutterSpinkitState createState() => _FlutterSpinkitState();
}

class _FlutterSpinkitState extends State<FlutterSpinkit> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => new PlaceListScreen(user: widget.user,googleSignIn: widget.googleSignIn)),
          ModalRoute.withName('/'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: Stack(children: <Widget>[
          SpinKitWanderingCubes(color: Colors.blue, shape: BoxShape.circle),
        ]),
      ),
    );
  }
}
