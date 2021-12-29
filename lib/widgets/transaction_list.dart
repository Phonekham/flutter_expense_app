import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_expense_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [Text('No Transactions')],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: IconButton(
                    onPressed: () => deleteTx(transactions[index].id),
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                  ),
                ),
              );
            },
          );
  }
}
