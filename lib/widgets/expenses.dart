import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Off Brand Amie',
      amount: 1.99,
      date: DateTime.now(),
      category: Category.subscriptions,
    ),
    Expense(
      title: 'Cinema',
      amount: 9.99,
      date: DateTime.now(),
      category: Category.subscriptions,
    ),
    Expense(
      title: 'Yousician',
      amount: 160.00,
      date: DateTime.now(),
      category: Category.subscriptions,
    ),
    Expense(
      title: 'Shiba',
      amount: 160.00,
      date: DateTime.now(),
      category: Category.kitties,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UwU Expenses'),
        actions: [
          const Text(" Add Expenses"),
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Text('Expenses'),
          Expanded(
            child: ExpenseList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
