import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:money_management/db/category/category_db.dart';
import 'package:money_management/db/transaction/transaction_db.dart';
import 'package:money_management/models/category/category_model.dart';
import 'package:money_management/models/transaction/transaction_model.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refreshUI();
    CategoryDb.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.transactionListNodifier,
      builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
        return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) {
              final _value = newList[index];
              return Slidable(
                key: Key(_value.id!),
                startActionPane: ActionPane(
                  motion: const BehindMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (ctx) {
                        TransactionDB.instance.deleteTransaction(_value.id!);
                      },
                      icon: Icons.delete_forever_outlined,
                      label: 'Delete',
                      backgroundColor: Colors.red,
                    )
                  ],
                ),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Text(
                        parseDate(_value.date),
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: _value.type == CategoryType.income
                          ? Colors.green[800]
                          : Colors.red[800],
                    ),
                    title: Text(_value.category.name),
                    subtitle: Text('RS ${_value.amount}'),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: newList.length);
      },
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitDate = _date.split(' ');
    return '${_splitDate.last}\n${_splitDate.first}';
  }
}
