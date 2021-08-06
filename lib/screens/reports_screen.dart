import 'package:flutter/material.dart';
class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFF4B53F5)
        ),
        title: Text(
          'Reports',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
      body:GridView(
        padding: EdgeInsets.symmetric(horizontal: 27, vertical: 13),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 160 / 94),
        children: [
        buildElevatedButton(context,route:'/attendance_screen',iconImage: 'images/time.png',label: 'Attendance'),
        buildElevatedButton(context,route:'/leave_screen',iconImage: 'images/leave.png',label: 'Leave'),
        buildElevatedButton(context,route:'/reports_screen',iconImage: 'images/employees_icon.png',label: 'Team'),
    ],
      ),

    );

  }

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



