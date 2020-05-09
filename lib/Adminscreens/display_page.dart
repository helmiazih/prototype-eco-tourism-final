import 'package:flutter/material.dart';

class DisplayPage extends StatefulWidget {
 
  String place;
  String state;
  String image;
  String status;

  DisplayPage ({Key key, this.place, this.state, this.image, this.status,}) : super (key:key);
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Display Page"),
      ),
      body:
        ListView(
          children: <Widget>[
            
            Container(
              decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(1, 89, 99, 1.0), Colors.grey],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child:  new Text ("${widget.place}"),
                  ),
                  Container(
                    child:  new Text ("${widget.state}"),
                  ),
                  Container(
                    child:  new Text ("${widget.image}"),
                  ),
                   Container(
                    child:  new Text ("${widget.status}"),
                  ),
                ],
              ),
            ),
            ),
          ],
        ), 
      
      // Container(
      //   child: new Text ("${widget.name}",),

      //   child: new Text ("${widget.phone}",),
      // )
      
      
      
    );
  }
}// TODO Implement this library.// TODO Implement this library.