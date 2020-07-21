import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../models/places.dart';
import '../services/places_services.dart';
import 'package:prototype/screens/detail_screen.dart';
import './favorite.dart';
import './AddPlace.dart';
import './AccountSetting.dart';

class PlaceListScreen extends StatefulWidget {
  @override
  _PlaceListScreenState createState() => _PlaceListScreenState();
}

Future<List<Place>> placeFuture;

class _PlaceListScreenState extends State<PlaceListScreen> {
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
                child: UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      child: Image.network(
                          'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60'),
                    ),
                    accountName: Text('Helmi Azih'),
                    accountEmail: Text('Hellow@gmail.com')),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Favourite'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => Favorite()));
                },
              ),
              ListTile(
                title: Text('Add New Place'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => AddPlace()));
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => AccountSetting()));
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
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                place[index].place.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  place[index].state.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white))
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              PlaceDataService().updateFavorite(
                                                  id: place[index].id,
                                                  fav: place[index].favorite);

                                              placeFuture = PlaceDataService()
                                                  .getAllPlaces();
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
