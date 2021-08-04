import 'package:flutter/material.dart';
import 'package:task_manager/screens/main_screen.dart';
import 'package:task_manager/screens/nb_screens/pk_task_screen/add_task_screen.dart';
import 'package:task_manager/screens/nb_screens/pk_task_screen/task_detail_screen.dart';

void main() =>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/main_screen',
      routes: {
        '/main_screen':(context)=>MainScreen(),
        '/add_task_screen':(context)=>AddTask(),
        '/task_detail_screen':(context)=>TaskDetail(),
      },
    );
  }
}


