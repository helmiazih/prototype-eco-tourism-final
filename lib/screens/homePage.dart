import 'package:carousel_pro/carousel_pro.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';

import 'loginfind.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      home: SplashScreen(
        'assets/splash.flr',
        MyHomePage(),
        startAnimation: 'intro',
        backgroundColor: Colors.white,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  _ImageCarouselState createState() => new _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Widget carousel = new Carousel(
      boxFit: BoxFit.cover,
      images: [
        new AssetImage("img/c1.jpg"),
        new AssetImage("img/c2.png"),
        new AssetImage("img/c3.jpg"),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
    );

    return new Scaffold(
      backgroundColor: Colors.blue,
      body: new Center(
        child: Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(40.0),
              height: screenHeight / 2,
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: new Stack(
                  children: [
                    carousel,
                  ],
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 200.0),
            ),
            SizedBox(
              width: 300,
              child: RaisedButton(
                elevation: 5.0,
                color: Colors.white,
                child: new Text(
                  "Find Place",
                  style: new TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ),
            // SizedBox(
            //   width: 300,
            //   child: RaisedButton(
            //     elevation: 5.0,
            //     color: Colors.white,
            //     child: new Text(
            //       "Add Place",
            //       style: new TextStyle(fontSize: 20.0, color: Colors.black),
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => LoginScreen2()),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
