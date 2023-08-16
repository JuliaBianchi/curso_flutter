import 'dart:math';

import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';


class TransactionUser extends StatefulWidget {

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactions = [
    Transaction(id: '1', title: 'Novo tênis de corrida', value: 420.00, date: DateTime.now()),
    Transaction(id: '2', title: 'Conta de luz', value: 215.56, date: DateTime.now()),
    Transaction(id: '3', title: 'Conta de luz', value: 215.56, date: DateTime.now()),
    Transaction(id: '4', title: 'Conta de luz', value: 215.56, date: DateTime.now()),
    Transaction(id: '5', title: 'Conta de luz', value: 215.56, date: DateTime.now()),
    Transaction(id: '6', title: 'Conta de luz', value: 215.56, date: DateTime.now()),
    Transaction(id: '7', title: 'Conta de luz', value: 215.56, date: DateTime.now()),
    Transaction(id: '8', title: 'Conta de luz', value: 215.56, date: DateTime.now()),
    Transaction(id: '9', title: 'Conta de luz', value: 215.56, date: DateTime.now()),
    Transaction(id: '10', title: 'Conta de luz', value: 215.56, date: DateTime.now()),
  ];

  _addTransaction(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ]
    );
  }
}
