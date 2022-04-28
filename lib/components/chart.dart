// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:expenses_flutter/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransation;

  Chart(this.recentTransation);

  List<Map<String, Object>> get groupedTransation {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransation.length; i++) {
        bool sameDay = recentTransation[i].date.day == weekday.day;
        bool sameMonth = recentTransation[i].date.month == weekday.month;
        bool sameYear = recentTransation[i].date.year == weekday.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransation[i].value;
        }
      }

      print(DateFormat.E().format(weekday)[0]);
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekday)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransation;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(children: []),
    );
  }
}
