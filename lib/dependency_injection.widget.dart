import 'package:flutter/material.dart';
import 'package:mangolove/shared/services/counter/counter.service.dart';

class DependencyInjectionWidget extends InheritedWidget {
  final Widget child;

  final _counterService = CounterService();
  CounterService get counterService => _counterService;

  DependencyInjectionWidget({this.child}) : super(child: child);

  static DependencyInjectionWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DependencyInjectionWidget>();
  }

  @override
  bool updateShouldNotify(DependencyInjectionWidget oldWidget) {
    return true;
  }
}
