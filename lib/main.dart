// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              color: Colors.blue,
              child: Text('Gráficos'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transations.map((tr) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                      width: 2,
                    )),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      tr.value.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 175, 27, 201),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        tr.date.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
