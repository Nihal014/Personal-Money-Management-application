import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/category/category_model.dart';
import 'package:flutter_application_1/model/transaction/transaction_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const transaction_db_name = 'transactiondb';

abstract class transactiondbfunctions {
  Future<void> addtransaction(transactionmodel obj);
  Future<List<transactionmodel>> getalltransactions();
  Future<void> deletetransaction(String id);
}

class transactiondb implements transactiondbfunctions {
  transactiondb.internal();
  static transactiondb instance = transactiondb.internal();
  factory transactiondb() {
    return instance;
  }

  ValueNotifier<List<transactionmodel>> transactionlistnotifier =
      ValueNotifier([]);
  @override
  Future<void> addtransaction(transactionmodel obj) async {
    final db = await Hive.openBox<transactionmodel>(transaction_db_name);
    await db.put(obj.id, obj);
  }

  Future<void> refresh() async {
    final list = await getalltransactions();
    list.sort((first, second) => second.date.compareTo(first.date));
    transactionlistnotifier.value.clear();
    transactionlistnotifier.value.addAll(list);
    transactionlistnotifier.notifyListeners();
  }

  @override
  Future<List<transactionmodel>> getalltransactions() async {
    final db = await Hive.openBox<transactionmodel>(transaction_db_name);
    return db.values.toList();
  }

  @override
  Future<void> deletetransaction(String id) async {
    final db = await Hive.openBox<transactionmodel>(transaction_db_name);
    await db.delete(id);
    refresh();
  }
}
