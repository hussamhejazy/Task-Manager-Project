import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/auth/create_account_screen.dart';
import 'package:task_manager/auth/forget_password_screen.dart';
import 'package:task_manager/auth/login_screen.dart';
import 'package:task_manager/screens/account_screen.dart';
import 'package:task_manager/preferences/app_preferences.dart';
import 'package:task_manager/screens/department_screens/add_departtment_Screen.dart';
import 'package:task_manager/screens/department_screens/department_screen.dart';
import 'package:task_manager/screens/employee_screens/add_employee_screen.dart';
import 'package:task_manager/screens/employee_screens/employee_screen.dart';
import 'package:task_manager/screens/report_screen/attendance_screen.dart';
import 'package:task_manager/screens/create_leave_screen.dart';
import 'package:task_manager/screens/hi_screen.dart';
import 'package:task_manager/screens/report_screen/leave_screen.dart';
import 'package:task_manager/screens/main_screen.dart';
import 'package:task_manager/screens/report_screen/reports_screen.dart';
import 'package:task_manager/screens/report_screen/team_screen.dart';
import 'launch_screen.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 await AppPreferences().initPreferences();

 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen':(context)=>LaunchScreen(),
        '/main_screen':(context)=>MainScreen(),
        '/login_screen':(context)=>LoginScreen(),
        '/attendance_screen':(context)=>Attendance(),
        '/leave_screen':(context)=>LeaveScreen(),
        '/create_leave_screen':(context)=>CreateLeaveScreen(),
        '/add_employee_screen':(context)=> AddEmployeeScreen(),
        '/employee_screen':(context)=> EmployeeScreen(),
        '/department_screen':(context)=> DepartmentScreen(),
        '/add_department_screen':(context)=> AddDepartmentScreen(),
        '/reports_screen':(context)=> ReportsScreen(),
        '/team_screen':(context)=> TeamScreen(),
        '/hi_screen':(context)=> HiScreen(),
        '/account_screen':(context)=> AccountScreen(),
        '/create_account_screen':(context)=> CreateAccountScreen(),
        '/forget_password_screen':(context)=> ForgetPasswordScreen(),
      },
    );
  }
}


