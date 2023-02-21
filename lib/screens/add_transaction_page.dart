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
                        selecteddate=selected_date;
                      });
                      
                    }
                  }
                },
                icon: Icon(Icons.calendar_today),
                label: Text(selecteddate==null?'select date':selecteddate.toString())),
                
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                        value: false,
                        groupValue: categoryType.income,
                        onChanged: (newvalue) {}),
                    Text('income'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: false,
                        groupValue: categoryType.expense,
                        onChanged: (newvalue) {}),
                    Text('expende'),
                  ],
                ),
              ],
            ),
            DropdownButton(
                hint: Text('select category'),
                items: Categorydb().incomecategorylistnerdb.value.map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name),
                  );
                }).toList(),
                onChanged: (selectedvalue) {
                  print(selectedvalue);
                }),
            ElevatedButton.icon(
                onPressed: () {}, icon: Icon(Icons.check), label: Text('add'))
          ],
        ),
      )),
    );
  }
}
