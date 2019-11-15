import 'package:flutter/material.dart';
import 'package:mangolove/shared/components/appBar.widget.dart';
import 'package:mangolove/shared/components/drawer.widget.dart';
import 'package:table_calendar/table_calendar.dart';

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
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TableCalendar(
        rowHeight: 40.0,
        availableGestures: AvailableGestures.horizontalSwipe,
        availableCalendarFormats: {CalendarFormat.month: 'Month'},
        calendarController: _calendarController,
      ),
    );
  }
}
