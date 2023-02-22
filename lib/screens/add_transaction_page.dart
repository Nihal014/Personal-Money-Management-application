import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/db/category_db.dart';
import 'package:flutter_application_1/model/category/category_model.dart';

class screenaddtransactionpage extends StatefulWidget {
  static const routeName = 'add-transaction';

  const screenaddtransactionpage({Key? key}) : super(key: key);

  @override
  State<screenaddtransactionpage> createState() =>
      _screenaddtransactionpageState();
}

class _screenaddtransactionpageState extends State<screenaddtransactionpage> {
  DateTime? selecteddate;
  categoryType? selected_categorytype;
  categoryModel? selectedcategorymodel;

  String? categoryid;

  @override
  void initState() {
    selected_categorytype = categoryType.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'purpose'),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'amount'),
              keyboardType: TextInputType.number,
            ),
            TextButton.icon(
                onPressed: () async {
                  final selected_date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 30)),
                      lastDate: DateTime.now());
                  if (selected_date == null) {
                    return;
                  } else {
                    {
                      print(selected_date.toString());
                      setState(() {
                        selecteddate = selected_date;
                      });
                    }
                  }
                },
                icon: Icon(Icons.calendar_today),
                label: Text(selecteddate == null
                    ? 'select date'
                    : selecteddate.toString())),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                        value: categoryType.income,
                        groupValue: selected_categorytype,
                        onChanged: (newvalue) {
                          setState(() {
                            selected_categorytype = categoryType.income;
                            categoryid = null;
                          });
                        }),
                    Text('income'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: categoryType.expense,
                        groupValue:
                            selected_categorytype, //group value and value should match to highlieght radioo
                        onChanged: (newvalue) {
                          setState(() {
                            selected_categorytype = categoryType.expense;
                            categoryid = null;
                          });
                        }),
                    Text('expende'),
                  ],
                ),
              ],
            ),
            DropdownButton<String>(
                hint: Text('select category'),
                value: categoryid,
                items: (selected_categorytype == categoryType.income
                        ? Categorydb().incomecategorylistnerdb
                        : Categorydb().expensecategorylistnerdb)
                    .value
                    .map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name),
                  );
                }).toList(),
                onChanged: (selectedvalue) {
                  print(selectedvalue);
                  setState(() {
                    categoryid = selectedvalue;
                  });
                }),
            ElevatedButton.icon(
                onPressed: () {}, icon: Icon(Icons.check), label: Text('add'))
          ],
        ),
      )),
    );
  }
}
