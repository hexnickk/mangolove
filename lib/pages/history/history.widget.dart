import 'package:flutter/material.dart';
import 'package:mangolove/pages/history/components/history-day-view.widget.dart';
import 'package:mangolove/shared/components/appBar.widget.dart';
import 'package:mangolove/shared/components/drawer.widget.dart';

class HistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBarFactory.build(title: 'History');

    final body = DateListWidget();

    return Scaffold(
      appBar: appBar,
      drawer: DrawerWidget(),
      body: body,
    );
  }
}

class DateListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DateListWidgetState();
  }
}

class _DateListWidgetState extends State<DateListWidget> {
  static const DAYS_STEP = 30;

  final _scrollController = ScrollController();

  var pastDays = DAYS_STEP;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: pastDays,
      itemBuilder: (context, index) => HistoryDayWidget(index),
    );
  }

  void _loadMore() {
    setState(() {
      pastDays += DAYS_STEP;
    });
  }
}
