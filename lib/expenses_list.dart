import 'package:expense_management_app/expense_item.dart';
import 'package:flutter/material.dart';

import 'package:expense_management_app/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expensesList, {super.key});

  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, idx) => ExpenseItem(expensesList[idx]),
    );
  }
}
