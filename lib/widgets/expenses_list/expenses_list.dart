import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    Key? key,
    required this.expenses,
    required this.onRemoveExpense,
  }) : super(key: key);

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
              key: ValueKey(expenses[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error,
                // child: const Icon(
                //   Icons.delete,
                //   color: Colors.white,
                //   size: 40,
                // ),
                // alignment: Alignment.centerRight,
                // padding: const EdgeInsets.only(right: 1),
                // margin: EdgeInsets.symmetric(
                //     horizontal: Theme.of(context).cardTheme.margin!.horizontal),
              ),
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
              child: ExpenseItem(expenses[index]),
            ));
  }
}
