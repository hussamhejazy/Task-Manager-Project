import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_auth_controller.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User _user;

  @override
  void initState() {
    _user = FbAuthController().user;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 204,
            width: double.infinity,
            color: Color(0xFFBEDDFF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Good Morning,',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          _user.displayName ?? '_',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 33,
                          color: Color(0xFFD5D7FF),
                          child: Center(
                            child: Text(_getTime()),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 33,
                          color: Colors.white,
                          child: Center(
                            child: Text(_Day()),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Image.asset(
                  'images/welcom.png',
                  alignment: AlignmentDirectional.bottomEnd,
                )
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: GridView(
              padding: EdgeInsets.symmetric(horizontal: 27, vertical: 13),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 160 / 94),
              children: [
                buildElevatedButton(context,route:'/employee_screen',iconImage: 'images/employees_icon.png',label: 'Employees'),
                buildElevatedButton(context,route:'/department_screen',iconImage: 'images/employees_icon.png',label: 'Departments'),
                buildElevatedButton(context,route:'/reports_screen',iconImage: 'images/employees_icon.png',label: 'Reports'),
              ],
            ),
          )],),);
  }
  ElevatedButton buildElevatedButton(BuildContext context, {required String route,required String iconImage, required String label}) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(iconImage),
          SizedBox(width: 8,),
          Text(label,style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),)
        ],
      ),
      style: ElevatedButton.styleFrom(
          primary: Color(0xFFFFFFFF),
          elevation: 1
      ),
    );
  }

  String _getTime() {
    TimeOfDay time = TimeOfDay.now();
      final h = time.hour.toString().padLeft(2, '0');
      final m = time.minute.toString().padLeft(2, '0');


      return '$h : $m';
    }

  String _Day(){
    String day = 'AM';
    if (TimeOfDay.now().hour >= 12) {
      day = 'PM';
    }
    return day;
  }
  }


