import 'package:flutter/material.dart';
import 'package:money_management/models/category/category_model.dart';

ValueNotifier<CategoryType> selectedCategoryNodifier =
    ValueNotifier(CategoryType.income);

Future<void> showCategoryAddedPopup(BuildContext context) async {
  showDialog(
    context: context,
    builder: (ctx) {
      return SimpleDialog(
        title: const Text('AddCategory'),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Category Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                RadioButton(title: 'Income', type: CategoryType.income),
                RadioButton(title: 'Expense', type: CategoryType.expense)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add'),
            ),
          )
        ],
      );
    },
  );
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;

  const RadioButton({
    Key? key,
    required this.title,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedCategoryNodifier,
          builder: (BuildContext ctx, CategoryType newCategory, child) {
            return Radio<CategoryType>(
              value: type,
              groupValue: newCategory,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                selectedCategoryNodifier.value = value;
                selectedCategoryNodifier.notifyListeners();
              },
            );
          },
        ),
        Text(title),
      ],
    );
  }
}
