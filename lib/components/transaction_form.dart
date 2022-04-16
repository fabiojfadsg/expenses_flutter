// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleControler,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueControler,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Nova Transsação'),
                  textColor: Colors.purple,
                  onPressed: _submitForm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
