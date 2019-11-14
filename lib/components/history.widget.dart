import 'package:flutter/material.dart';
import 'package:mangolove/shared/components/drawer.widget.dart';

// TODO:
// [] remove mango image
// [] add calendar
// [] add mango service integration

class HistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('History'),
    );

    final body = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/mango.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('History page'),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      drawer: DrawerWidget(),
      body: body,
    );
  }
}
