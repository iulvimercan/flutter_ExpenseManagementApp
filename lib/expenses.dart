import 'package:expense_management_app/expenses_list.dart';
import 'package:expense_management_app/new_expense.dart';
import 'package:flutter/material.dart';

import 'package:expense_management_app/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Groceries',
      amount: 100.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Cinema',
      amount: 50.00,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Cruise',
      amount: 500.00,
      date: DateTime.now(),
      category: Category.travel,
    )
  ];

  void _openAddExpenseForm() {
    showModalBottomSheet(
      // isScrollControlled: true, // to make it fullscreen
      context: context,
      builder: (ctx) => NewExpense(_saveExpense),
    );
  }

  void _saveExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted!'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = _registeredExpenses.isEmpty
        ? const Center(child: Text('No expenses added yet!'))
        : ExpensesList(_registeredExpenses, _deleteExpense);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Manager'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseForm,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
