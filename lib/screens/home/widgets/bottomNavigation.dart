import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screens/home/screenHome.dart';

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: screenHome.selectedindexnotifier,
      builder: (BuildContext ctx , int updatedindex, Widget? _) {
        return BottomNavigationBar(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
            currentIndex: updatedindex,
            onTap: (newindex) {
              screenHome.selectedindexnotifier.value = newindex;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'transaction'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'category')
            ]);
      },
    );
  }
}
