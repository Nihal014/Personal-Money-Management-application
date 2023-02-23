import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/category_db.dart';
import 'package:flutter_application_1/model/category/category_model.dart';
import 'package:flutter_application_1/model/transaction/transactiondb.dart';
import 'package:intl/intl.dart';

import '../../model/transaction/transaction_model.dart';

class screentransaction extends StatelessWidget {
  const screentransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    transactiondb.instance.refresh();
    Categorydb.instance.refreshUI();
    return ValueListenableBuilder(
        valueListenable: transactiondb.instance.transactionlistnotifier,
        builder: (BuildContext ctx, List<transactionmodel> newlist, Widget? _) {
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) {
              final value = newlist[index];
              return Card(
                elevation: 0,
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: value.type == categoryType.income
                          ? Colors.green
                          : Colors.red,
                      radius: 45,
                      child: Text(
                        parsedate(value.date),
                        textAlign: TextAlign.center,
                      )),
                  title: Text('Rs${value.amount}'),
                  subtitle: Text(value.category.name),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: newlist.length,
          );
        });
  }

  String parsedate(DateTime date) {
    final ddate = DateFormat.MMMd().format(date);
    final splitdate = ddate.split(' ');
    return '${splitdate.last}\n${splitdate.first}';
    //return '${date.day}\n${date.month}';
  }
}
