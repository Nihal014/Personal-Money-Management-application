import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/category/expenseCategory.dart';
import 'package:flutter_application_1/screens/category/incomeCategorylist.dart';

class screenCategory extends StatefulWidget {
  const screenCategory({Key? key}) : super(key: key);

  @override
  State<screenCategory> createState() => _screenCategoryState();
}

class _screenCategoryState extends State<screenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          unselectedLabelColor: Colors.grey,labelColor: Colors.black,
          controller: _tabController,
          tabs: [
          Tab(
            text: 'income',
          ),
          Tab(
            text: 'expense',
          )
        ]),
        Expanded(child: TabBarView(controller: _tabController, children: [incomeCategory(),expenseCategory()]))
      ],
    );
  }
}
