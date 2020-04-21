import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransactions,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransactions;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
        title:
            Text(transaction.title, style: Theme.of(context).textTheme.title),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () => deleteTransactions(transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text("Delete"),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTransactions(transaction.id),
              ),
      ),
    );
  }
}
