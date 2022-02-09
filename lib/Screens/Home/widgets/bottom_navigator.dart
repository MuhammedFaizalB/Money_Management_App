import 'package:flutter/material.dart';

import '../home_screen.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HomeScreen.selectedIndexNodifier,
      builder: (BuildContext ctx, int updatedindex, Widget? _) {
        return BottomNavigationBar(
            currentIndex: updatedindex,
            onTap: (newIndex) {
              HomeScreen.selectedIndexNodifier.value = newIndex;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money_outlined),
                label: 'Transaction',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: 'Category',
              )
            ]);
      },
    );
  }
}
