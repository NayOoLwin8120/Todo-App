import 'package:flutter/material.dart';
class TodoDataType with ChangeNotifier {
  final int id;
  final String task_name;
  final String desc;
  final String category;
  final DateTime date;
  final Color color;
   bool isFinish;

  TodoDataType({required this.id,required this.task_name,required this.desc,required this.isFinish,required this.category, required this.date , required this.color});
  set setIsFinish(bool data){
    isFinish = data;
  }
}