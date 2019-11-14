import 'package:path/path.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  static const _dbFile = 'db.sqlite';

  static Future<Database> get _db async {
    return openDatabase(
      join(await getDatabasesPath(), _dbFile),
      version: 1,
    );
  }

  static final db$ = Observable(Stream.fromFuture(_db)).shareReplay(maxSize: 1);
}
