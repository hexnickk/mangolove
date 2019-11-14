import 'package:mangolove/shared/services/db.model.dart';

class Counter implements BaseDBModel {
  final int id;
  final DateTime date;

  Counter({
    this.id,
    this.date,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Counter.fromMap(Map<String, dynamic> map) {
    return Counter(
      id: map['id'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }
}
