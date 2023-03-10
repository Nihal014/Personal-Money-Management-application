import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/category/category_model.dart';
import 'package:hive_flutter/adapters.dart';

const categorydbname = 'databasename';

abstract class categorydbfunctions {
  Future<List<categoryModel>> getcategories();
  Future<void> insertcategory(categoryModel value);
  Future<void> deletecategory(String categoryID);
}

class Categorydb implements categorydbfunctions {
  Categorydb.internal();//check and study
  static Categorydb instance = Categorydb.internal();

  factory Categorydb() {
    return instance;
  }

  ValueNotifier<List<categoryModel>> incomecategorylistnerdb =
      ValueNotifier([]);

  ValueNotifier<List<categoryModel>> expensecategorylistnerdb =
      ValueNotifier([]);

  @override
  Future<void> insertcategory(categoryModel value) async {
    final categorydb = await Hive.openBox<categoryModel>(categorydbname);
    await categorydb.put(value.id,value);
    refreshUI();
  }

  @override
  Future<List<categoryModel>> getcategories() async {
    final categorydb = await Hive.openBox<categoryModel>(categorydbname);
    return categorydb.values.toList();
  }

  Future<void> refreshUI() async {
    final allcategories = await getcategories();

    incomecategorylistnerdb.value.clear();
    expensecategorylistnerdb.value.clear();
    await Future.forEach(allcategories, (categoryModel categoryyy) {
      if (categoryyy.type == categoryType.income) {
        incomecategorylistnerdb.value.add(categoryyy);
      } else {
        expensecategorylistnerdb.value.add(categoryyy);
      }
    });

    incomecategorylistnerdb.notifyListeners();
    expensecategorylistnerdb.notifyListeners();
  }

  @override
  Future<void> deletecategory(String categoryID) async {
    final Categorydb = await Hive.openBox<categoryModel>(categorydbname);
    Categorydb.delete(categoryID);
    refreshUI();
  }
}
