import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_homework/Providers/todo_data_list.dart';

class Home_Info_Card extends StatelessWidget {
  const Home_Info_Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();
    final list = context.watch<ToDoDataList>().todoList;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 17,horizontal: 13),
        padding: EdgeInsets.all(13),

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children:const  [
                    Text('Good Afternoon',style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300
                    ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text("Ko Nay",style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400
                    ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text('Today',style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                    color: Colors.indigoAccent
                ),
                ),
                const SizedBox(
                  height: 7,
                ),
                 Text('${DateFormat("dd MMMM , yyy").format(dateTime)}',style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Text('Completed',style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                       color: Colors.lightGreen
                  ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children:  [
                      Text("${list.where((element) => element.isFinish).length} /",style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: Colors.lightGreen
                      ),
                      ),
                      Text("${list.length}",style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: Colors.redAccent
                      ),
                      )

                    ],
                  )
                ],
              ),
            )
          ],
        ),

    );
  }
}
