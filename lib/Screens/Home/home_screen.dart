import 'package:flutter/material.dart';

import 'package:money_management/Screens/category/category.dart';
import 'package:money_management/Screens/category/category_popup.dart';
import 'package:money_management/Screens/transaction/add_transaction.dart';
import 'package:money_management/Screens/transaction/transaction.dart';

import 'widgets/bottom_navigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexNodifier = ValueNotifier(0);

  final _pages = const [
    Transaction(),
    Category(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text('Money Manager'),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavigator(),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: selectedIndexNodifier,
        builder: (BuildContext ctx, int updatedIndex, Widget? _) {
          return _pages[updatedIndex];
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[800],
        onPressed: () {
          if (selectedIndexNodifier.value == 0) {
            Navigator.of(context).pushNamed(AddTransaction.routeName);
          } else {
            showCategoryAddedPopup(context);
            // final _sample = CategoryModel(
            //   id: DateTime.now().millisecondsSinceEpoch.toString(),
            //   name: 'Food',
            //   type: CategoryType.expense,
            // );
            // CategoryDb().insertCategory(_sample);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
