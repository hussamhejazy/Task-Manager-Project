import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  List<String> _names = [
    'Jonathan Doe',
    'Mohammed Doe',
    'Jonathan Doe',
    'Jonathan Doe',
    'Jonathan Doe',
    'Jonathan Doe',
    'Jonathan Doe',
    'Jonathan Doe',
    'Jonathan Kareem'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,
      title:Text('Employees',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.black)
      ,),
      elevation: 5,
      actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacementNamed(context, '/add_employee_screen');
          }, icon: Icon(Icons.add)
          ,iconSize: 30,
          color: Color(0XFF4B53F5),),
      ],
    ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),        itemCount: _names.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
              radius: 30,
              backgroundImage: AssetImage('images/profile.png')),
              title: Text(_names[index]),
              subtitle: Text('Department'),
            ),
          );
        },
      ),
          );
        }
}