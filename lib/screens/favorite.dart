import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:prototype/models/task.dart';

import 'detail_screen.dart';

class Favorite extends StatefulWidget {
  final List<Task> _data;
  Favorite(this._data);
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("Favorite")),
        body: Container(
            padding: EdgeInsets.all(3.0),
            child:  GridView.builder (
              itemCount: widget._data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 3.0),
              itemBuilder: (BuildContext context, int index) {
                return  GestureDetector(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                          widget._data[index].place,
                          widget._data[index].image,
                          widget._data[index].status,
                          widget._data[index].favorite,
                          ))),
                  child: Stack(
                    children: <Widget>[
                      Hero(
                          tag: widget._data[index].place,
                          child: Image.asset(
                            widget._data[index].image,
                            fit: BoxFit.fill,
                            height: 210,
                          )),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 70,
                          color: Colors.black.withOpacity(0.3),
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 14),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      widget._data[index].place,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(widget._data[index].state,
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget._data[index].favorite =
                                          !widget._data[index].favorite;
                                          widget._data.removeAt(index);
                                    });
                                  },
                                  child: Icon(
                                      widget._data[index].favorite
                                          ? EvaIcons.heart
                                          : EvaIcons.heartOutline,
                                      color: widget._data[index].favorite
                                          ? Colors.red
                                          : Colors.white,
                                      size: 30),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                );
              },
            )));
  }
}
