import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Text(
                  '1$index\n Feb',
                  textAlign: TextAlign.center,
                ),
              ),
              title: const Text('Food'),
              subtitle: const Text('100'),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 10);
  }
}
