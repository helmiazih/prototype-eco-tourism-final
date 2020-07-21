import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../models/places.dart';
import '../services/places_services.dart';

import 'detail_screen.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

Future<List<Place>> favoriteFuture;

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    super.initState();
    favoriteFuture = PlaceDataService().getAllFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("Favorite")),
        body: Container(
            padding: EdgeInsets.all(3.0),
            child: FutureBuilder(builder: (context, s) {
              return FutureBuilder(
                future: favoriteFuture,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var place = snapshot.data;
                  return snapshot.hasData
                      ? GridView.builder(
                          itemCount: place.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                                                    place[index]
                                                        .place
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18.0),
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
                                              GestureDetector(
                                                onTap: () {
                                                  PlaceDataService()
                                                      .updateFavorite(
                                                          id: place[index].id,
                                                          fav: place[index]
                                                              .favorite);

                                                  favoriteFuture =
                                                      PlaceDataService()
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
              );
            })));
  }
}
