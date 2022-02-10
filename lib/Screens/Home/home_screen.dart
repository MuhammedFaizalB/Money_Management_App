import 'package:flutter/material.dart';

import 'package:money_management/Screens/category/category.dart';
import 'package:money_management/Screens/category/category_popup.dart';
import 'package:money_management/Screens/transaction/add_transaction.dart';
import 'package:money_management/Screens/transaction/transaction.dart';
import 'package:money_management/db/category/category_db.dart';
import 'package:money_management/models/category/category_model.dart';

import 'widgets/bottom_navigator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexNodifier = ValueNotifier(0);

  final _pages = const [
    Transaction(),
    Category(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Money Manager'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigator(),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: selectedIndexNodifier,
        builder: (BuildContext ctx, int updatedIndex, Widget? _) {
          return _pages[updatedIndex];
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNodifier.value == 0) {
            print('Add Transaction');
            Navigator.of(context).pushNamed(AddTransaction.routeName);
          } else {
            print('Add Category');
            showCategoryAddedPopup(context);
            // final _sample = CategoryModel(
            //   id: DateTime.now().millisecondsSinceEpoch.toString(),
            //   name: 'Food',
            //   type: CategoryType.expense,
            // );
            // CategoryDb().insertCategory(_sample);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
