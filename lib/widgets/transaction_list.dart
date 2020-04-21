import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactions;

  const TransactionList(this.transactions, this.deleteTransactions);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    "No transactions added yet",
                    style: Theme.of(context).textTheme.title,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover),
                    height: constraints.maxHeight * 0.6,
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(transaction: transactions[index], deleteTransactions: deleteTransactions);
            },
            itemCount: transactions.length,
          );
  }
}

