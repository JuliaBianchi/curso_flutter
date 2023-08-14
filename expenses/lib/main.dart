import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpansesApp());

class ExpansesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _transations = [
    Transaction(id: '1', title: 'Novo tênis de corrida', value: 420.00, date: DateTime.now()),
    Transaction(id: '2', title: 'Conta de luz', value: 215.56, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //crossAxisAlignment: CrossAxisAlignment.center - por padrão fica no centro
        children: <Widget> [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Gráfico'),
            ),
          ),
          Card(
            child: Text('Lista de Transações'),
          )
        ],
      ),
    );
  }
}
