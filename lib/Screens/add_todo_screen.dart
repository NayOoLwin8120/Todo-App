import 'package:flutter/material.dart';
import 'package:todo_homework/Components/color_card.dart';
import 'package:todo_homework/Model/todo_data_type.dart';
import "dart:math";
import 'package:todo_homework/Providers/todo_data_list.dart';
import 'package:provider/provider.dart';
class Add_ToDo_Screen extends StatefulWidget {
    final String? task_name;
    final int? id;
    final String? desc;
    final String? category;
    final DateTime? date;
    final Color? color;
    final bool? isFinish;
   Add_ToDo_Screen({String? this.desc,bool? this.isFinish,String? this.category,int? this.id,String? this.task_name,DateTime? this.date,Color? this.color});
  @override
  State<Add_ToDo_Screen> createState() => _Add_ToDo_ScreenState();
}

class _Add_ToDo_ScreenState extends State<Add_ToDo_Screen> {
  final List data = [Colors.redAccent,Colors.yellow,Colors.blueAccent,Colors.greenAccent];
  final _formKey = GlobalKey<FormState>();
  DateTime datePick = DateTime.now();
  Color colorPick = Colors.greenAccent;
  final taskController = TextEditingController();
  final descController = TextEditingController();
  final categoryController = TextEditingController();
  void _showDatePicker (){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2200)
    ).then((value) => {
        setState(() {
          datePick = value!;
        })
    });
  }
  void _setColor(data){
    setState(() {
      colorPick = data!;
    });
  }

  void _setData () {
    if(_formKey.currentState!.validate()){
      final formData = TodoDataType(
          id: widget.id ?? new Random().nextInt(100000),
          task_name: taskController.text,
          category: categoryController.text,
          desc: descController.text,
          date: datePick,
          isFinish: widget.isFinish ?? false,
          color: colorPick);
       if(widget.id ==null){
         context.read<ToDoDataList>().addTodoItem(item: formData);
       }else{
         debugPrint('...............pass here ................');
         context.read<ToDoDataList>().updateToDoData(id: widget.id, data: formData);
       }
      Navigator.of(context).pop();
    }
  }

  @override
  void initState(){
    super.initState();
    taskController.text=  widget.task_name ?? "";
    descController.text = widget.desc ?? "";
    datePick = widget.date ?? DateTime.now();
    colorPick = widget.color  ?? Colors.greenAccent;
    categoryController.text = widget.category ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('${widget.id == null ? 'New' :'Update'} Task'),
        toolbarHeight: 80,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10,top: 26),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child:Badge(
                child:  Icon(Icons.notifications_active_outlined,size: 30,),
              ),
            )
          ),
        ],
      ),
      body: Form(
        key: _formKey,
          child: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration:const  BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                              width: 1.0,
                              color: Colors.grey
                          )
                      )
                  ),
                  child:TextFormField(
                    controller: taskController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Need To Fill The Task Name !";
                      }else{
                        return null;
                      }
                    },
                    decoration:const  InputDecoration(
                        hintText: "Task Name",
                        contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 20)
                    ),
                  ),
                ),
                Container(
                  decoration:const  BoxDecoration(
                      color: Colors.white,

                  ),
                  child:TextFormField(
                    controller: descController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Need To Fill The Description  !";
                      }else{
                        return null;
                      }
                    },
                    decoration:const  InputDecoration(
                        hintText: "Description",
                        contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 20)
                    ),
                  ),
                ),
                Container(
                  decoration:const  BoxDecoration(
                      color: Colors.white,
                  ),
                  child:TextFormField(
                    controller: categoryController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Need To Fill The Category !";
                      }else{
                        return null;
                      }
                    },
                    decoration:const  InputDecoration(
                        hintText: "Category",

                        contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),

                    ),
                  ),
                ),
                Container(
                  decoration:const  BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(
                              width: 1.0,
                              color: Colors.grey
                          )
                      )
                  ),
                  child: GestureDetector(
                    onTap: (){_showDatePicker();},
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 18),
                      child :Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select Date',style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600
                          ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(datePick.toString().split(" ")[0])
                        ],
                      ),
                    ),
                  )
                ),
                Container(
                  child: Text('Priority',style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600
                  ),),
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ...data.map((e)=> GestureDetector(
                            onTap: (){
                              _setColor(e);
                            },
                            child:  Color_Card(data: e),
                          )
                          ).toList(),
                        ],
                      ),
                      Column(

                        children: [
                          Color_Card(data: colorPick),
                          SizedBox(
                            height: 2,
                          ),
                          Text("Select Color"),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                ElevatedButton(
                    onPressed: (){
                      _setData();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigoAccent,
                        minimumSize: Size.fromHeight(50)
                    ),
                    child: Text(' ${widget.id == null ? 'Add New' :'Update '}Task',style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                    ),
                    )
                ),
              ],
            ),
          ),
      )
    );
  }
}
