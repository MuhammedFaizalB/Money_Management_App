import 'package:flutter/material.dart';

import 'expense_category_list.dart';
import 'income_category_list.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.grey[700],
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
