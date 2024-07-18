import 'package:expense_management_app/expenses_list.dart';
import 'package:flutter/material.dart';

import 'package:expense_management_app/models/expense.dart';

class Expenses extends StatelessWidget {
  Expenses({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
