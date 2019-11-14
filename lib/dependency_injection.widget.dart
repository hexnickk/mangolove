import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:mangolove/router.dart';
import 'package:mangolove/shared/services/counter/counter.service.dart';

class DependencyInjectionWidget extends InheritedWidget {
  final Widget child;

  final _router = Router.router;
  fluro.Router get router => _router;

  final _counterService = CounterService();
  CounterService get counterService => _counterService;

  DependencyInjectionWidget({this.child}) : super(child: child) {
    Router.forRoot();
  }

  static DependencyInjectionWidget of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(DependencyInjectionWidget)
        as DependencyInjectionWidget);
  }

  @override
  bool updateShouldNotify(DependencyInjectionWidget oldWidget) {
    return true;
  }
}
