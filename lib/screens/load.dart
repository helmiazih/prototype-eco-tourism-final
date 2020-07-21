import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../models/userMockData.dart';

import './places.dart';

class FlutterSpinkit extends StatefulWidget {
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
          MaterialPageRoute(builder: (context) => PlaceListScreen()),
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
