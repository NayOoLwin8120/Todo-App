import "package:todo_homework/Model/todo_data_type.dart";
import 'package:flutter/material.dart';

class ToDoDataList with ChangeNotifier {
  List<TodoDataType> todoList = [
    TodoDataType(id: 10, task_name: " Home Work", desc: 'Test',isFinish: false , category: "Work", date: DateTime.now(), color: Colors.yellow),
    TodoDataType(id: 11, task_name: "Play Game", desc: 'Test', isFinish: true,category: "Work", date: DateTime.now(), color: Colors.greenAccent)
  ];
   int? detailsId ;

  void addTodoItem({required TodoDataType item}) {
    todoList.add(item);
    notifyListeners();
  }

  void setDetailsId({required int id}){
    detailsId = id;
    notifyListeners();
  }

   List filterToDoData(){
    return todoList.where((element) => element.id == detailsId).toList();
   }

   void updateToDoData({required  id,required TodoDataType data}){
     todoList[todoList.indexWhere((element) => element.id == id)] = data;
     notifyListeners();
   }
   void updateIsFinish({required int id}){
     todoList[todoList.indexWhere((element) => element.id == id)].isFinish = !todoList[todoList.indexWhere((element) => element.id == id)].isFinish;
     notifyListeners();
   }

   void deleteToDo({required int id}){
    todoList = todoList.where((element) => element.id != id).toList();
    notifyListeners();

   }


}
