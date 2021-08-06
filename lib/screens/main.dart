import 'package:flutter/material.dart';
import 'package:task_manager/screens/add_departtment_Screen.dart';
import 'package:task_manager/screens/add_employee_screen.dart';
import 'package:task_manager/screens/attendance_screen.dart';
import 'package:task_manager/screens/create_leave_screen.dart';
import 'package:task_manager/screens/department_screen.dart';
import 'package:task_manager/screens/employee_screen.dart';
import 'package:task_manager/screens/leave_screen.dart';
import 'package:task_manager/screens/main_screen.dart';
import 'package:task_manager/screens/nb_screens/pk_task_screen/add_task_screen.dart';
import 'package:task_manager/screens/nb_screens/pk_task_screen/task_detail_screen.dart';
import 'package:task_manager/screens/reports_screen.dart';

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
        '/attendance_screen':(context)=>Attendance(),
        '/leave_screen':(context)=>LeaveScreen(),
        '/create_leave_screen':(context)=>CreateLeaveScreen(),
        '/add_employee_screen':(context)=> AddEmployeeScreen(),
        '/employee_screen':(context)=> EmployeeScreen(),
        '/department_screen':(context)=> DepartmentScreen(),
        '/add_department_screen':(context)=> AddDepartmentScreen(),
        '/reports_screen':(context)=> ReportsScreen(),

      },
    );
  }
}


