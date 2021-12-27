import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_expense_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [Text('No Transactions')],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          transactions[index].amount.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
