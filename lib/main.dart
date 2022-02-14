import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management/Screens/transaction/add_transaction.dart';
import 'package:money_management/models/category/category_model.dart';
import 'package:money_management/models/transaction/transaction_model.dart';

import 'Screens/Home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      title: 'Money Management',
      home: const HomeScreen(),
      routes: {
        AddTransaction.routeName: (ctx) {
          return const AddTransaction();
        }
      },
    );
  }
}
