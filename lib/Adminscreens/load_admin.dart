import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prototype/Adminscreens/admin_model/admin_mockdata.dart';
import 'package:prototype/Adminscreens/admin_model/mock_data_admin.dart';
import 'package:prototype/Adminscreens/todo_screen_admin.dart';




class FlutterSpinkitAdmin extends StatefulWidget {
  @override
  _FlutterSpinkitState createState() => _FlutterSpinkitState();
}

class _FlutterSpinkitState extends State<FlutterSpinkitAdmin> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => TodoListScreenAdmin(mockDataAdmin,adminMockData)),
          ModalRoute.withName('/')
          );
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
