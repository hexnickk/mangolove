import 'package:mangolove/shared/services/counter/counter.model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class CounterState {
  final counters$ = ReplaySubject<List<Counter>>(maxSize: 1);

  CounterState() {
    counters$.add([]);
  }

  Observable<List<Counter>> select(bool Function(Counter) selector) {
    return counters$.map((counters) => counters.where(selector).toList());
  }

  Observable insertOne(Counter counter) {
    return insertMany([counter]);
  }

  Observable insertMany(List<Counter> newCounters) {
    return counters$
        .take(1)
        .doOnData(
            (oldCounters) => counters$.add([...oldCounters, ...newCounters]))
        .mapTo(null);
  }
}
