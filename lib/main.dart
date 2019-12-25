import 'package:flutter/material.dart';
import 'package:mangolove/dependency_injection.widget.dart';
import 'package:mangolove/router.dart';

void main() {
  Router.forRoot();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DependencyInjectionWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mango lover',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        initialRoute: 'counter',
        onGenerateRoute: Router.router.generator,
      ),
    );
  }
}
