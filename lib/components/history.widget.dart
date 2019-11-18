import 'package:flutter/material.dart';
import 'package:mangolove/shared/components/appBar.widget.dart';
import 'package:mangolove/shared/components/drawer.widget.dart';

// TODO:
// [] remove mango image
// [] add calendar
// [] add mango service integration

class HistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBarFactory.build(title: 'History');

    final body = Container(
      child: CalendarWidget(),
    );

    return Scaffold(
      appBar: appBar,
      drawer: DrawerWidget(),
      body: body,
    );
  }
}

class CalendarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarWidgetState();
  }
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
