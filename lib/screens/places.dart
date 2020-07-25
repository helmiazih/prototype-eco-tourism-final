import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prototype/screens/loginfind.dart';
import '../models/places.dart';
import '../services/places_services.dart';
import 'package:prototype/screens/detail_screen.dart';
import './favorite.dart';
import './AddPlace.dart';
import './AccountSetting.dart';

class PlaceListScreen extends StatefulWidget {
  PlaceListScreen({this.user, this.googleSignIn});
  final FirebaseUser user;
  final GoogleSignIn googleSignIn;

  @override
  _PlaceListScreenState createState() => _PlaceListScreenState();
}

Future<List<Place>> placeFuture;

class _PlaceListScreenState extends State<PlaceListScreen> {
  _signOut(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Sign Out?'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    widget.googleSignIn.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
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

  @override
  void initState() {
    super.initState();
    placeFuture = PlaceDataService().getAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            this.setState(() {
              placeFuture = PlaceDataService().getAllPlaces();
            });
          },
          child: Icon(EvaIcons.refresh),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: new Column(
                      children: <Widget>[
                        Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image:
                                        new NetworkImage(widget.user.photoUrl),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(75.0)),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 7.0, color: Colors.black)
                                ])),
                        Flexible(
                          child: Text(
                            widget.user.displayName,
                            style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favourite'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => Favorite()));
                },
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text('Add New Place'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => AddPlace()));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => AccountSetting()));
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sign Out'),
                onTap: () {
                  _signOut(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Places'),
        ),
        body: Container(
          padding: EdgeInsets.all(3.0),
          child: FutureBuilder(
            future: placeFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var place = snapshot.data;
              return snapshot.hasData
                  ? GridView.builder(
                      itemCount: place.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3.0,
                          mainAxisSpacing: 3.0),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => Detail(
                                        place[index].place,
                                        place[index].image,
                                        place[index].status,
                                        place[index].favorite)));
                          },
                          child: Container(
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                  place[index].image,
                                  fit: BoxFit.fill,
                                  height: 210,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 70,
                                    color: Colors.black.withOpacity(0.3),
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 0, 10, 14),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Flexible(
                                            child: new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  place[index].place.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0),
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    place[index]
                                                        .state
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white))
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              PlaceDataService().updateFavorite(
                                                  id: place[index].id,
                                                  fav: place[index].favorite);

                                              placeFuture = PlaceDataService()
                                                  .getAllPlaces();
                                              SnackBar snackBar = SnackBar(
                                                content: Text(
                                                    "Add this place into your favourite"),
                                                backgroundColor: Colors.green,
                                              );
                                              Scaffold.of(context)
                                                  .showSnackBar(snackBar);
                                            },
                                            child: Icon(
                                                place[index].favorite
                                                    ? EvaIcons.heart
                                                    : EvaIcons.heartOutline,
                                                color: place[index].favorite
                                                    ? Colors.red
                                                    : Colors.white,
                                                size: 30),
                                          )
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('Please Wait'),
                    );
            },
          ),
        ));
  }
}
