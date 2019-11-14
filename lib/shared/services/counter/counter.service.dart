import 'package:mangolove/shared/services/counter/counter.model.dart';
import 'package:mangolove/shared/services/counter/counter.state.dart';
import 'package:mangolove/shared/services/counter/counter_db.service.dart';
import 'package:mangolove/shared/services/db.service.dart';
import 'package:rxdart/rxdart.dart';

class CounterService {
  final _counterState = CounterState();
  final _counterDBService = CounterDbService(DBService.db$);

  CounterService() {
    _counterDBService
        .queryAll()
        .flatMap((counters) => _counterState.insertMany(counters))
        .listen(null);
  }

  Observable<List<Counter>> select(bool Function(Counter) selector) {
    return _counterState.select(selector);
  }

  Observable insertOne(Counter counter) {
    return Observable(MergeStream([
      _counterState.insertOne(counter),
      _counterDBService.insertOne(counter),
    ]));
  }
}
