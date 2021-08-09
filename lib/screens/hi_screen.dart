import 'package:flutter/material.dart';
class HiScreen extends StatefulWidget {
  const HiScreen({Key? key}) : super(key: key);

  @override
  _HiScreenState createState() => _HiScreenState();
}

class _HiScreenState extends State<HiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFDBDDFF),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         CircleAvatar(
        radius: 50,
           backgroundImage: AssetImage('images/hi.png'),
      ),
        SizedBox(height: 15),
        Text('Your request has been sent',style: TextStyle(fontWeight: FontWeight.normal
            ,fontSize:18,color: Colors.black ),),
         SizedBox(height: 15),
         Text('Please verify your account',style: TextStyle(fontWeight: FontWeight.normal
             ,fontSize:16,color: Colors.black ),),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/main_screen');                },
            child: Text('Go back'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
            ),
          ),
       ],)
      ),
    );
  }
}

/*
*
*  return Scaffold(
      backgroundColor: Color(0XFFDBDDFF),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage:
              NetworkImage('images/true.png'),
              backgroundColor: Color(0XFF00DF1A),

            )
          ],
        ),
      ),
    );*/