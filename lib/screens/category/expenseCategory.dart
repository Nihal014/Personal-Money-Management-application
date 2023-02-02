import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class expenseCategory extends StatelessWidget {
  const expenseCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, index) {
        return  ListTile(title: Text('expense category $index'),trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            ),);
        },
        separatorBuilder: (ctx, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: 10);
  }
}
