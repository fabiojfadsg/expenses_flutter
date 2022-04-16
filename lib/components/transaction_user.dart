// ignore_for_file: use_key_in_widget_constructors

import 'dart:math';

import 'package:expenses_flutter/models/transaction.dart';
import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 'T1',
      title: 'Novo Tênis',
      value: 234.09,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T2',
      title: 'Novo PC',
      value: 1989.09,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
    id: Random().nextDouble().toString(),
    title: title,
    value: value,
    date: DateTime.now());
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
