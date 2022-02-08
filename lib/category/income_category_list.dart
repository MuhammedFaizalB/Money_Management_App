import 'package:flutter/material.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 2,
            child: ListTile(
              title: Text('Income List $index'),
              trailing: IconButton(
                  onPressed: () {}, icon: Icon(Icons.delete_forever)),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 50);
  }
}