import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screens/category/screenCategory.dart';
import 'package:flutter_application_1/screens/home/widgets/bottomNavigation.dart';
import 'package:flutter_application_1/screens/transaction/screenTransaction.dart';

class screenHome extends StatelessWidget {
  const screenHome({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedindexnotifier = ValueNotifier(0);
  final pages = const [screentransaction(), screenCategory()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.grey[100]),
      appBar: AppBar(title: Text('MONEY MANAGER'),
      centerTitle: true,),
      bottomNavigationBar: const bottomNavigation(),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: selectedindexnotifier,
        builder: (BuildContext ctx, int updatedindex, _) {
          return pages[updatedindex];
        },
      )),floatingActionButton: FloatingActionButton(onPressed: () {
        if(selectedindexnotifier.value==0){
            print('add transaction');
        }
        else{
          print('add category');
        }
        
      },child: Icon(Icons.add),),
    );
  }
}
