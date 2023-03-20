import 'package:flutter/material.dart';
import 'package:todo_homework/Screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_homework/Providers/providers.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
              backgroundColor:  Colors.indigoAccent,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(15)
              // )
            )
        ),
        home: Home_Screen(),
      ),
    );
  }
}

