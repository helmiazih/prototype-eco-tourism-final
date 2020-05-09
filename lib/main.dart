import 'package:flutter/material.dart';

import 'package:prototype/screens/homePage.dart';
import 'package:prototype/screens/loginfind.dart';

void main() => runApp(MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
          case '/homePage':
            return MaterialPageRoute(builder: (context) => MyApp());

          case '/login':
            return MaterialPageRoute(builder: (context) => LoginScreen());
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    ));
