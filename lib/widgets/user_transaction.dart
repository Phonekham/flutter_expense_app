import 'package:flutter/material.dart';
import 'package:flutter_expense_app/models/transaction.dart';
import 'package:flutter_expense_app/widgets/new_transaction.dart';
import 'package:flutter_expense_app/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 'id1', title: 'title1', amount: 200, date: DateTime.now()),
    Transaction(id: 'id2', title: 'title2', amount: 300, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(), TransactionList(_userTransactions)],
    );
  }
}
