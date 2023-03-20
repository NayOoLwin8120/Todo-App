import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_homework/Providers/todo_data_list.dart';
import 'package:todo_homework/Screens/add_todo_screen.dart';

class ToDo_Details extends StatefulWidget {
  const ToDo_Details({Key? key}) : super(key: key);
  @override
  State<ToDo_Details> createState() => _ToDo_DetailsState();
}

class _ToDo_DetailsState extends State<ToDo_Details> {
  @override
  Widget build(BuildContext context) {
    final data = context.watch<ToDoDataList>().filterToDoData()[0];
    return Scaffold(
      appBar: AppBar(
        title: Text("${data.task_name}"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Add_ToDo_Screen(id: data.id,color: data.color,task_name: data.task_name,desc: data.desc,date: data.date,category: data.category,isFinish: data.isFinish,)));
              },
              icon: Icon(Icons.update_outlined)
          )
        ],
      ),
      body: Container(
        color: Colors.grey.shade200,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                 decoration: BoxDecoration(
                     color: Colors.indigoAccent,
                     borderRadius: BorderRadius.circular(4)
                 ),
                 child: Text("Category : ${data.category}",style: TextStyle(
                     color: Colors.white,
                     fontSize: 18,
                     fontWeight: FontWeight.w500
                 ),
                 ),
               ),
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                 width: 30,
                 height: 30,
                 decoration: BoxDecoration(
                     color: data.color,
                     borderRadius: BorderRadius.circular(20)
                 ),
               ),
               Container(
                 child: data.isFinish ? Icon(Icons.star,color: Colors.indigoAccent,) : Icon(Icons.star_outline_outlined,color: Colors.indigoAccent,),
               )
             ],
           ),
            SizedBox(
              height: 10,
            ),
             Text("Description",style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${data.desc}",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
            ),
            )
          ],
        ),
      )

    );
  }
}

