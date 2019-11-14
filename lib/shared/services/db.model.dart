import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class BaseDBModel {
  Map<String, dynamic> toMap();
  BaseDBModel.fromMap(Map<String, dynamic> map);
}

abstract class BaseDBService<T extends BaseDBModel> {
  BaseDBService(Observable<Database> db$);
  Observable insertOne(T item);
  Observable<List<T>> queryAll();
}
