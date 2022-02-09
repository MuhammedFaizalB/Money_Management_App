import 'package:hive_flutter/adapters.dart';
import 'package:money_management/models/category/category_model.dart';

const category_db_name = 'category_name';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getCategory();
  Future<void> insertCategory(CategoryModel value);
}

class CategoryDb implements CategoryDbFunctions {
  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categorydb = await Hive.openBox<CategoryModel>(category_db_name);
    await _categorydb.add(value);
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    final _categorydb = await Hive.openBox<CategoryModel>(category_db_name);
    return _categorydb.values.toList();
  }
}
