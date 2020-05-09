import 'package:flutter/material.dart';
import 'package:prototype/Adminscreens/task_screen_admin.dart';
import 'package:prototype/models/mock_data.dart';
import 'package:prototype/models/task.dart';
import 'package:prototype/models/todo.dart';
import 'package:prototype/models/user.dart';
import 'package:prototype/screens/favorite.dart';
import 'package:prototype/screens/homePage.dart';
import 'package:prototype/screens/profile.dart';
import 'package:prototype/screens/setting.dart';




class TodoListScreenAdmin extends StatefulWidget {
  final List _data;
  final Users userData;

  TodoListScreenAdmin(this._data,this.userData);
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreenAdmin> {

  @override
  void initState() {
    
    super.initState();
 
  }
  _signOut(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Sign Out?'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text('Yes')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'))
            ],
          );
        });
  }

  void _navigate(index) async {
    final returnData = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TaskListScreenAdmin(Todo.copy(widget._data[index]))));
    if (returnData != null) {
      setState(() => widget._data[index] = returnData);
    }
  }
 

  Future<bool> _onBackPressed(){
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Are you sure you want to quit this app?"),
        actions: <Widget>[
          FlatButton(onPressed: () => Navigator.pop(context,false), child: Text("No")),
          FlatButton(onPressed: () => Navigator.pop(context,true), child: Text("Yes")),
        ],
      ),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          title: Text('Eco-Tourism'),
        ),
        drawer: Drawer(
          child: ListView(children: <Widget>[
            DrawerHeader(
              child: Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image:widget.userData.userImage==null? AssetImage('img/user.png'):FileImage(widget.userData.userImage),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(75.0)),
                              boxShadow: [
                                BoxShadow(blurRadius: 7.0, color: Colors.black)
                              ])),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyProfile()),
                                );
                              },
                              child: Text(
                                widget.userData.username,
                                style: new TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
              onTap: ()  {
               List<Task> tasks = new List<Task>();
              mockData.forEach((data) => data.items
                  .forEach((task) => task.favorite ? tasks.add(task) : null));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Favorite(tasks)));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingUser()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () {
                _signOut(context);
              },
            ),
          ]),
        ),
        body: WillPopScope(
          onWillPop: _onBackPressed,
                  child: ListView.builder(
            itemCount: widget._data.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => _navigate(index),
              child: Container(
                  height: 250.0,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage(widget._data[index].image),
                          fit: BoxFit.cover)),
                  child: ListTile(
                      title: Text(
                    widget._data[index].title.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ))),
            ),
          ),
        ),
     
    );
  }
}
