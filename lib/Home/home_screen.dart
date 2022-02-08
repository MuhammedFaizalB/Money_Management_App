import 'package:flutter/material.dart';
import 'package:money_management/Home/widgets/bottom_navigator.dart';
import 'package:money_management/category/category.dart';
import 'package:money_management/transaction/transaction.dart';

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
          } else {
            print('Add Category');
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
