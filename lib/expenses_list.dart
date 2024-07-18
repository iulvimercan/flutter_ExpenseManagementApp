import 'package:expense_management_app/expense_item.dart';
import 'package:flutter/material.dart';

import 'package:expense_management_app/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expensesList, this.deleteExpense, {super.key});

  final List<Expense> expensesList;
  final void Function(Expense expesnse) deleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, idx) => Dismissible(
        onDismissed: (DismissDirection direction) => deleteExpense(expensesList[idx]),
        key: ValueKey(expensesList[idx]),
        child: ExpenseItem(expensesList[idx]),
      ),
    );
  }
}
