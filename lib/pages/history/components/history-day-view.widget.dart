import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mangolove/dependency_injection.widget.dart';
import 'package:mangolove/shared/services/counter/counter.service.dart';

bool isSameDay(DateTime date1, DateTime date2) =>
    date1.year == date2.year &&
    date1.month == date2.month &&
    date1.day == date2.day;

class HistoryDayWidget extends StatelessWidget {
  final int pastDays;

  HistoryDayWidget(this.pastDays);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now().subtract(Duration(days: pastDays));
    final format = DateFormat.yMMMMd('en_US').format(date);

    var di = DependencyInjectionWidget.of(context);
    CounterService _counterService = di.counterService;

    var countersCount$ = _counterService
        .select((counter) => isSameDay(counter.date, date))
        .map((counters) => counters.length);

    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: Row(
        children: <Widget>[
          Text(format.toString()),
          Text(' - '),
          StreamBuilder(
              stream: countersCount$,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Text(snapshot.data.toString())
                    : Text('...');
              }),
        ],
      ),
    );
  }
}
