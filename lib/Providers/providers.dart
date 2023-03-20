import 'package:provider/provider.dart';
import "package:provider/single_child_widget.dart";
import 'package:todo_homework/Providers/todo_data_list.dart';
final List<SingleChildWidget> providers  = [
  ChangeNotifierProvider(
      create: (context) => ToDoDataList(),
  ),
];