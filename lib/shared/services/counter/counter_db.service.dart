import 'dart:ffi';

import 'package:mangolove/shared/services/counter/counter.model.dart';
import 'package:mangolove/shared/services/db.model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';

class CounterDbService implements BaseDBService<Counter> {
  final table = 'counters';
  Observable<Database> _db$;

  CounterDbService(this._db$) {
    _db$.take(1).listen((db) => db.execute(
          'CREATE TABLE IF NOT EXISTS $table(id INTEGER PRIMARY KEY, date INTEGER)',
        ));
  }

  @override
  Observable insertOne(item) {
    return _db$
        .take(1)
        .doOnData((db) => db.insert(table, item.toMap()))
        .mapTo(null);
  }

  @override
  Observable<List<Counter>> queryAll() {
    return _db$.take(1).asyncMap((db) => db.query(table)).map((counters) =>
        List.generate(counters.length, (i) => Counter.fromMap(counters[i])));
  }
}
