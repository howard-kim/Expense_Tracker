import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //intl 패키지 안에 시간 관련 여러가지 기능이 존재
import 'package:uuid/uuid.dart';

final formatter =
    DateFormat.yMd(); //이것으로 포매터의 형식을 지정해주는 것 DateFormat안에는 여러종류의 형식이 존재

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

class Expense {
  //하나의 비용에 대한 구조체
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses //부가적인 생성자 함수 만드는 방법임
            .where((expense) =>
                expense.category ==
                category) //category 같은 애들로만 분류해주는거임 where을 통해서
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
