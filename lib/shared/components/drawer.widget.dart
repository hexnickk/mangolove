import 'package:flutter/material.dart';
import 'package:mangolove/router.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Count mangos'),
              onTap: () => Router.navigateTo(context, 'counter'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('History'),
              onTap: () => Router.navigateTo(context, 'history'),
            ),
          ],
        ),
      ),
    );
  }
}
