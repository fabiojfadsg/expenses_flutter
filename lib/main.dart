// ignore_for_file: prefer_const_constructors

import 'package:expenses_flutter/models/transation.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transations = [
    Trasation(
      id: 'T1',
      title: 'Novo Tênis',
      value: 234.09,
      date: DateTime.now(),
    ),
    Trasation(
      id: 'T2',
      title: 'Novo PC',
      value: 1989.09,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Despesas Pessoais')),
      body: Center(child: Text('Versão Inicial')),
    );
  }
}
