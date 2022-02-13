import 'package:hive_flutter/adapters.dart';

import 'package:money_management/models/transaction/transaction_model.dart';

const transaction_db_name = 'transaction-db';

abstract class TransactionDbFunction {
  Future<void> addTransaction(TransactionModel obj);
}

class TransactionDB implements TransactionDbFunction {
  TransactionDB._internal();

  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() {
    return instance;
  }
  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final _db = await Hive.openBox<TransactionModel>(transaction_db_name);
    await _db.put(obj.id, obj);
  }
}
