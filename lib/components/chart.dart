// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:expenses_flutter/models/transaction.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransation;

  const Chart(this.recentTransation);

  List<Map<String, Object>> get groupedTransations {
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

      return {
        'day': DateFormat.E().format(weekday)[0],
        'value': totalSum,
        'percentage': totalSum / recentTransation.length,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue{
    return groupedTransations.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransations;
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransations.map((tr) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(tr,
                  label: tr['day'] as String,
                  value: tr['value'] as double,
                  percentage: _weekTotalValue == 0.0 ?
                  0.0 : ((tr['percentage'] as double)) / _weekTotalValue,
                ),
              );
            }).toList(),
          ),
        ));
  }
}
