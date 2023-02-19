import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/db/category_db.dart';

import '../../model/category/category_model.dart';

class expenseCategory extends StatelessWidget {
  const expenseCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Categorydb().expensecategorylistnerdb,
        builder: (BuildContext ctx, List<categoryModel> newlist, Widget? _) {
          return ListView.separated(
              itemBuilder: (ctx, index) {
                final categ = newlist[index];
                return Card(
                  child: ListTile(
                    title: Text(categ.name),
                    trailing: IconButton(
                      onPressed: () {
                        Categorydb.instance.deletecategory(categ.id);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: newlist.length);
        });
  }
}
