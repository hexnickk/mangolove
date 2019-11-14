import 'package:flutter/material.dart';
import 'package:mangolove/router.dart';

void main() {
  Router.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mango lover',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: 'counter',
      onGenerateRoute: Router.router.generator,
    );
  }
}
