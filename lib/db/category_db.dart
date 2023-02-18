import 'package:flutter_application_1/model/category/category_model.dart';
import 'package:hive_flutter/adapters.dart';

const categorydbname = 'databasename';

abstract class categorydbfunctions {
  Future<List<categoryModel>> getcategories();
  Future<void> insertcategory(categoryModel value);
}

class Categorydb implements categorydbfunctions {
  @override
  Future<void> insertcategory(categoryModel value) async {
    final categorydb = await Hive.openBox<categoryModel>(categorydbname);
    await categorydb.add(value);
  }

  @override
  Future<List<categoryModel>> getcategories() async {
    final categorydb = await Hive.openBox<categoryModel>(categorydbname);
    return categorydb.values.toList();
  }

  
}
