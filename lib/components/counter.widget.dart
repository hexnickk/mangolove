import 'package:flutter/material.dart';
import 'package:mangolove/dependency_injection.widget.dart';
import 'package:mangolove/shared/components/appBar.widget.dart';
import 'package:mangolove/shared/components/drawer.widget.dart';
import 'package:mangolove/shared/services/counter/counter.model.dart';
import 'package:mangolove/shared/services/counter/counter.service.dart';
import 'package:rxdart/rxdart.dart';

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  Observable<List<Counter>> _counters$;
  CounterService _counterService;

  void _init() async {
    final today = DateTime.now();
    _counters$ = _counterService
        .select((counter) => counter.date.day == today.day)
        .doOnData((data) {});
  }

  void _incrementCounter() {
    _counterService.insertOne(Counter(date: DateTime.now())).listen(null);
  }

  @override
  Widget build(BuildContext context) {
    var di = DependencyInjectionWidget.of(context);
    _counterService = di.counterService;
    _init();

    final appBar = AppBarFactory.build(title: 'Counter');

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
            Text('You have ate mango this many times:'),
            StreamBuilder(
              stream: _counters$,
              builder: (context, snapshot) {
                final textStyle = Theme.of(context).textTheme.display1;
                if (snapshot.hasData) {
                  final counter = snapshot.data.length;
                  return Text('$counter', style: textStyle);
                } else {
                  return Text('0', style: textStyle);
                }
              },
            ),
          ],
        ),
      ),
    );

    final floatingActionButton = FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );

    return Scaffold(
      appBar: appBar,
      drawer: DrawerWidget(),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
