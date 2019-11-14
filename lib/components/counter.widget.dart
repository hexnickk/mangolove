import 'package:flutter/material.dart';
import 'package:mangolove/shared/components/drawer.widget.dart';

// TODO:
// [] make mango image smaller
// [] make mango image above counter text
// [] add mango service integration

class CounterWidget extends StatefulWidget {
  CounterWidget({Key key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Counter'),
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
            Text('You have ate mango this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.display1),
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
