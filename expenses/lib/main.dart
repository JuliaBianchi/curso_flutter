import 'dart:math';
import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(ExpansesApp());

class ExpansesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ThemeData tema = ThemeData();

    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple.shade600,
          secondary: Colors.orange.shade500,
        ),
        textTheme: tema.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(id: 't0', title: 'Conta de Antiga', value: 211.30, date: DateTime.now().subtract(const Duration(days: 33)),),
    Transaction(id: 't1', title: 'Conta Luz', value: 400.00, date: DateTime.now().subtract(const Duration(days: 3)),),
    Transaction(id: 't2', title: 'Conta de Água', value: 211.30, date: DateTime.now().subtract(const Duration(days: 5)),),
    Transaction(id: 't3', title: 'Conta de Internet', value: 100.00, date: DateTime.now()),
    Transaction(id: 't4', title: 'Cartão', value: 500.30, date: DateTime.now()),

  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
    //ponto em que ele sabe que é um modal
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
