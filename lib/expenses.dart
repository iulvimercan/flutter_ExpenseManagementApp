import 'package:expense_management_app/expenses_list.dart';
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
      context: context,
      builder: (ctx) {
        return const Text('Add Expense Form');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
            child: ExpensesList(_registeredExpenses),
          ),
        ],
      ),
    );
  }
}
