import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_homework/Providers/todo_data_list.dart';
import 'package:todo_homework/Screens/todo_details.dart';

class ToDo_List_Card extends StatelessWidget {
  final String title;
  final String category;
  final DateTime dateTime;
  final Color piority;
  final bool isFinish;
  final int id;
  const ToDo_List_Card({required String this.title,required this.id,required this.isFinish,required String this.category,required DateTime this.dateTime,required this.piority});
  @override
  Widget build(BuildContext context) {
    final setDetailData = (){
      context.read<ToDoDataList>().setDetailsId(id: id);
    };
    return Dismissible(
        onDismissed: (direction){
          if(direction == DismissDirection.startToEnd){
            context.read<ToDoDataList>().updateIsFinish(id: id);
          }else{
            context.read<ToDoDataList>().deleteToDo(id: id);
          }
          debugPrint('.............$direction $id.....................');
        },
        background: Container(
          color: isFinish ? Colors.green : Colors.indigoAccent,
          child: Row(
            children:  [
              SizedBox(
                width: 50,
                child: isFinish ? Icon(Icons.remove_circle_outline_outlined,size: 30,color: Colors.white,) : Icon(Icons.task_alt_outlined,size: 30,color: Colors.white,),
              ),
              Text("${isFinish ? 'UnDone' : 'Done'}",style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
              ),

            ],
          ),
        ),
        secondaryBackground: Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:   [
              SizedBox(
                width: 50,
                child: Icon(Icons.delete_outline_outlined,size: 30,color: Colors.white,),
              ),
              Text('Delete',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
              ),
            ],
          ),
        ),
        key: GlobalKey(),
        child: GestureDetector(
          onTap: (){
            setDetailData();
            showBottomSheet(
                context: context,
                enableDrag: true,
                builder: (context)=>SizedBox(
                  height: 500,
                  child: ToDo_Details(),
                )
            );
          },
          child: Container(
            padding:const  EdgeInsets.symmetric(vertical: 17,horizontal: 12),
            decoration:const BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        color: Colors.black,
                        width: 1.0
                    )
                )
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 90,
                  child: Column(
                    children:   [
                      Text("${DateFormat.MMM().format(dateTime)}-${dateTime.day}" ,style: TextStyle(
                          fontSize: 18
                      ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("${dateTime.year}",style: TextStyle(
                          fontSize: 16,
                          fontWeight:FontWeight.bold
                      ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(title,style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(category,style: TextStyle(
                                fontSize: 16,
                                fontWeight:FontWeight.w300
                            ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            isFinish! ?  Icon(Icons.star,color: Colors.indigoAccent,) : Icon(Icons.star_outline,color: Colors.indigoAccent,),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: piority,
                                  borderRadius: BorderRadius.circular(25)
                              ),
                            )
                          ],

                        )

                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        )
    );
  }
}
