import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:prototype/Adminscreens/form_screen.dart';

import 'package:prototype/models/todo.dart';
import 'package:prototype/screens/detail_screen.dart';


class TaskListScreenAdmin extends StatefulWidget {
  final Todo _data;

  TaskListScreenAdmin(this._data);
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreenAdmin> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(widget._data.title),
        ),
        body: Container(
            padding: EdgeInsets.all(3.0),
            child: GridView.builder(
              itemCount: widget._data.items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 3.0),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onLongPress: (){
                  setState(() {
                  widget._data.items.removeAt(index);
                   });
                 },
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                          widget._data.items[index].place,
                          widget._data.items[index].image,
                          widget._data.items[index].status,
                          widget._data.items[index].favorite,
                          ))),
                  child: Stack(
                    children: <Widget>[
                      Hero(
                          tag: widget._data.items[index].image,
                          child: Image.asset(
                            widget._data.items[index].image,
                            fit: BoxFit.fill,
                            height: 210,
                          )),
                      // Image(image: AssetImage(widget._data.items[index].image),fit: BoxFit.fill,height: 200,),
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
                                      widget._data.items[index].place,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(widget._data.items[index].state,
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget._data.items[index].favorite =
                                          !widget._data.items[index].favorite;
                                    });
                                  },
                                  child: Icon(
                                      widget._data.items[index].favorite
                                          ? EvaIcons.heart
                                          : EvaIcons.heartOutline,
                                      color: widget._data.items[index].favorite
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
            )),
            floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () { navigate(); }
                ),
                
                
                
                
                );
  }
  void navigate() async{
    final returnData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormScreen(),
      ),
    );

    if (returnData != null){
      setState(() => widget._data.items.add(returnData));
    }
  }
}