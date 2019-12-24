import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mangolove/dependency_injection.widget.dart';
import 'package:mangolove/shared/services/counter/counter.service.dart';

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
        .select((counter) => counter.date.difference(date).inDays == 0)
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
                if (!snapshot.hasData) {
                  return Text('...');
                }
                final data = snapshot.data;
                return Text(data.toString());
              }),
        ],
      ),
    );
  }
}
