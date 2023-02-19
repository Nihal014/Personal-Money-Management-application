import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../db/category_db.dart';
import '../../model/category/category_model.dart';

class incomeCategory extends StatelessWidget {
  const incomeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return ValueListenableBuilder(
        valueListenable: Categorydb().incomecategorylistnerdb,
        builder: (BuildContext ctx, List<categoryModel> newlist, Widget? _) {
          return ListView.separated(
              itemBuilder: (ctx, index) {
                final categ = newlist[index];
                return Card(
                  child: ListTile(
                    title: Text(categ.name),
                    trailing: IconButton(
                      onPressed: () {},
                      icon:const Icon(Icons.delete),
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
