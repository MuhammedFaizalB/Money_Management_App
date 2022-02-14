import 'package:flutter/material.dart';
import 'package:money_management/db/category/category_db.dart';

import 'expense_category_list.dart';
import 'income_category_list.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    CategoryDb().refreshUI();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            tabs: const [
              Tab(
                text: 'Income',
              ),
              Tab(
                text: 'Expense',
              ),
            ],
          ),
          const Expanded(
            child: TabBarView(children: [
              IncomeCategoryList(),
              ExpenseCategoryList(),
            ]),
          )
        ],
      ),
    );
  }
}
