import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/category_db.dart';
import 'package:flutter_application_1/model/category/category_model.dart';

ValueNotifier<categoryType> selected_category_notifier =
    ValueNotifier(categoryType.income);

Future<void> showcategoryaddpopup(BuildContext context) async {
  final nameeditingcontroller = TextEditingController();

  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: const Text('add category'),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameeditingcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'add category'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  radiobutton(title: 'income', type: categoryType.income),
                  radiobutton(title: 'expense', type: categoryType.expense)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    final name = nameeditingcontroller.text.trim();
                    if (name.isEmpty) {
                      return;
                    }
                    final typ = selected_category_notifier.value;
                    final categoryy = categoryModel(
                        id: DateTime.now().millisecond.toString(),
                        name: name,
                        type: typ);

                    Categorydb().insertcategory(categoryy);
                    Navigator.of(ctx).pop();//remove the popup overrlay from category screen(ctx used becayse context is context of screen)
                  },
                  child: const Text('add')),
            )
          ],
        );
      });
}

class radiobutton extends StatelessWidget {
  final String title;
  final categoryType type;
  const radiobutton({Key? key, required this.title, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selected_category_notifier,
            builder:
                (BuildContext context, categoryType newcategory, Widget? _) {
              return Radio<categoryType>(
                  value: type,
                  groupValue: newcategory,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    selected_category_notifier.value = value;
                    selected_category_notifier.notifyListeners();
                  });
            }),
        Text(title)
      ],
    );
  }
}
