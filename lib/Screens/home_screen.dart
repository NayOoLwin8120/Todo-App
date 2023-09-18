
import 'package:flutter/material.dart';
import 'package:todo_homework/Components/home_info_card.dart';
import 'package:todo_homework/Components/todo_list_card.dart';
import 'package:todo_homework/Screens/add_todo_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_homework/Providers/todo_data_list.dart';
import 'package:todo_homework/Components/nothing_to_do.dart';
import 'package:http/http.dart' as http;

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {


  @override
  Widget build(BuildContext context) {
    final data = context.watch<ToDoDataList>().todoList.reversed;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        bottom: AppBar(
         automaticallyImplyLeading: false,
          title: Autocomplete<String>(
            fieldViewBuilder: (BuildContext context,
                TextEditingController fieldTextEditingController,
                FocusNode fieldFocusNode,
                VoidCallback onFieldSubmitted){
              return Container(
                padding: EdgeInsets.only(left: 15),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 100),
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.white)
                // ),
                child: TextField(
                    controller: fieldTextEditingController,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search Task',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(Icons.search,color: Colors.white,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),

                ),
              );
            },
            optionsBuilder: (TextEditingValue textEditingValue){
              if(textEditingValue.text == ''){
                return Iterable.empty();
              }else{
              // final newData = data.where((element) => element.task_name.contains(textEditingValue.text.toLowerCase())).toList();
                final newData = data.where((element) => element.task_name.toLowerCase().contains(textEditingValue.text.toLowerCase())).toList();
                debugPrint('..........$newData.......');
               return newData.map((e) => e.task_name);
                // return Iterable.empty();
              }
            },

          ),
          centerTitle: true,
        ),
        toolbarHeight: 80,
          title: Row(
            children:const [
              Text('Things',style: TextStyle(
                fontWeight: FontWeight.w300
              ),),
              Text("ToD",style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400
              ),
              ),
              Icon(Icons.settings,size: 24,)
            ],
          ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10,top: 26),
            child:const Badge(
              child:  Icon(Icons.notifications_active_outlined,size: 30,),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Add_ToDo_Screen()));
              },
              icon: Icon(Icons.add,size: 30,),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: ()async{
                  var response= await http.get(Uri.parse('https://random.imagecdn.app/v1/image?width=500&height=500&category=people') );
                  var response2= await http.post(Uri.parse('https://random.imagecdn.app/v1/image?width=500&height=500&category=people'),headers:{'connection':'how are you'}  );
                  print(response.statusCode);
                  print(response2.headers);
              },
              icon: Icon(Icons.account_circle,size: 30,),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: (){
                Autocomplete<String>(
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted){
                    return Container(
                      padding: EdgeInsets.only(left: 15),
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.white)
                      // ),
                      child: TextField(
                        controller: fieldTextEditingController,
                        style: TextStyle(
                            color: Colors.white
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search Task',
                          hintStyle: TextStyle(color: Colors.white),
                          suffixIcon: Icon(Icons.search,color: Colors.white,),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none,
                          ),
                        ),

                      ),
                    );
                  },
                  optionsBuilder: (TextEditingValue textEditingValue){
                    if(textEditingValue.text == ''){
                      return Iterable.empty();
                    }else{
                      // final newData = data.where((element) => element.task_name.contains(textEditingValue.text.toLowerCase())).toList();
                      final newData = data.where((element) => element.task_name.toLowerCase().contains(textEditingValue.text.toLowerCase())).toList();
                      debugPrint('..........$newData.......');
                      return newData.map((e) => e.task_name);
                      // return Iterable.empty();
                    }
                  },

                );
              },
              icon: Icon(Icons.search,size: 30,),
            ),
          ),

        ],
        ),
        body:  Column(
          children: [
            data.where((element) => element.isFinish).length == data.length ?  Nothing_To_Do() :Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  Home_Info_Card(),
                  Container(
                    child: Column(
                      children:  [

                        SizedBox(
                          height: MediaQuery.of(context).size.height / 1.64,
                          child: SingleChildScrollView(
                            controller: ScrollController(),
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                ...data.map((e) => ToDo_List_Card(id: e.id,title: e.task_name, category: e.category, dateTime: e.date,piority: e.color,isFinish: e.isFinish,)).toList()
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,

              ),
              child: Center(
                child:
                Image.network("https://images.unsplash.com/photo-1678004668997-a1d587d104c4?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3OTM3NTg0NA&ixlib=rb-4.0.3&q=80&w=500")

              )
              ),

            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),

    );
  }
}
