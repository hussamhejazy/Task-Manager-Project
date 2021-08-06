import 'package:flutter/material.dart';
class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({Key? key}) : super(key: key);

  @override
  _DepartmentScreenState createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
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
        title:Text('Departments',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.black)
          ,),
        elevation: 5,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacementNamed(context, '/add_department_screen');
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
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text(_names[index]),
              subtitle: Text('Department'),
            ),
          );
        },
      ),
    );
  }
}
