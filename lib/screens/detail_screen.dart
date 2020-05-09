import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final String place;
  final String image;
  final String status;
  final bool fav;
  Detail(this.place, this.image,this.status, this.fav);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        // title: Text(place),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: new Column(children: <Widget>[
        new Container(
          width: MediaQuery.of(context).size.width,
          margin: MediaQuery.of(context).padding,
          child: new Hero(
              tag: widget.place,
              child: new Material(
                child: new InkWell(
                    child: new Image.asset(
                  "${widget.image}",
                  fit: BoxFit.cover,
                  height: 240.0,
                )),
              )),
        ),
        NamePlace(
          place: widget.place,
          fav: widget.fav,
        ),
        ContactPart(),
        SizedBox(
          height: 200,
        ),
        Container(
        
          width: MediaQuery.of(context).size.width,
          margin: MediaQuery.of(context).padding,
          height: 40,
          child: Text(widget.status,style: TextStyle(fontSize: 30),textAlign: TextAlign.center
          ),
          decoration: BoxDecoration(
        color:widget.status == 'Open'?  Colors.green: Colors.red,
      ),
        )
      ]),
    );
  }
}

class NamePlace extends StatefulWidget {
  final String place;
  bool fav;
  NamePlace({this.place, this.fav});

  @override
  _NamePlaceState createState() => _NamePlaceState();
}

class _NamePlaceState extends State<NamePlace> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  widget.place,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "${widget.place}\@gmail.com",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new IconButton(
                  icon: Icon(Icons.location_on, color: Colors.blue),
                  onPressed: null)
              // new IconButton(
              //   icon: widget.fav
              //       ? Icon(
              //           EvaIcons.heart,
              //           color: Colors.red,
              //         )
              //       : Icon(
              //           EvaIcons.heartOutline,
              //           color: Colors.grey,
              //         ),
              //   iconSize: 30.0,
              //   color: Colors.black,
              //   onPressed: () {
              //     setState(() {
              //       widget.fav = !widget.fav;
              //     });
              //     SnackBar snackBar = SnackBar(
              //       content: Text("Add this place into your favourite"),
              //       backgroundColor: Colors.green,

              //     );
              //     Scaffold.of(context).showSnackBar(snackBar);
              //   },
              // ),
            ],
          )
        ],
      ),
    );
  }
}

class ContactPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Iconteks(
            icon: Icons.call,
            teks: "Call",
          ),
          new Iconteks(
            icon: Icons.message,
            teks: "Message",
          ),
          new Iconteks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});
  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 18.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}
