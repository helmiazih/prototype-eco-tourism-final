import 'package:flutter/material.dart';
import 'package:prototype/models/places.dart';
import '../services/places_services.dart';
import 'package:snack/snack.dart';

TextEditingController image = TextEditingController();
TextEditingController place = TextEditingController();
TextEditingController state = TextEditingController();
TextEditingController status = TextEditingController();

class AddPlace extends StatefulWidget {
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  void addPlace() {
    Place newPlace = new Place(
        image: image.text,
        place: place.text,
        state: state.text,
        status: status.text,
        favorite: false);

    PlaceDataService().addPlace(place: newPlace);
    final bar = SnackBar(content: Text('New places successfully added'));

    bar.show(context);
    image.text = '';
    place.text = '';
    state.text = '';
    status.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add New Place',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            margin: MediaQuery.of(context).padding,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                TextFormField(
                  controller: image,
                  decoration: InputDecoration(hintText: 'Image Url'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: place,
                  decoration: InputDecoration(hintText: 'Place Name'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: state,
                  decoration: InputDecoration(
                    hintText: 'State',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: status,
                  decoration: InputDecoration(
                    hintText: 'Status',
                  ),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: addPlace,
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
