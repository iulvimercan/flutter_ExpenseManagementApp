import 'package:flutter/material.dart';

import 'package:expense_management_app/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expensesList, {super.key});

  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, ind) => Text(expensesList[ind].title),
    );
  }
}
