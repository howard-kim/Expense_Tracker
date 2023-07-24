import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, trabel, leisure, work }

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
}
