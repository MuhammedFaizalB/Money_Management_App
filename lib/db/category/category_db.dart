import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management/Screens/category/income_category_list.dart';
import 'package:money_management/models/category/category_model.dart';

const category_db_name = 'category_name';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getCategory();
  Future<void> insertCategory(CategoryModel value);
  Future<void> deleteCategory(String categoryID);
}

class CategoryDb implements CategoryDbFunctions {
  CategoryDb._internal();
  static CategoryDb instance = CategoryDb._internal();

  factory CategoryDb() {
    return instance;
  }

  final ValueNotifier<List<CategoryModel>> incomeCategoryList =
      ValueNotifier([]);
  final ValueNotifier<List<CategoryModel>> expenseCategoryList =
      ValueNotifier([]);
  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categorydb = await Hive.openBox<CategoryModel>(category_db_name);
    await _categorydb.put(value.id, value);
    refreshUI();
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    final _categorydb = await Hive.openBox<CategoryModel>(category_db_name);
    return _categorydb.values.toList();
  }

  Future<void> refreshUI() async {
    incomeCategoryList.value.clear();
    expenseCategoryList.value.clear();
    final _allCategory = await getCategory();
    Future.forEach(_allCategory, (CategoryModel category) {
      if (category.type == CategoryType.income) {
        incomeCategoryList.value.add(category);
      } else {
        expenseCategoryList.value.add(category);
      }
    });
    incomeCategoryList.notifyListeners();
    expenseCategoryList.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String categoryID) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(category_db_name);
    await _categoryDB.delete(categoryID);
    refreshUI();
  }
}
