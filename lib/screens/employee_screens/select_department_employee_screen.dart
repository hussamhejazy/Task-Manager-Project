import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
import 'package:task_manager/models/Employee.dart';

import 'add_employee_screen.dart';

class SelectDepartmentScreen extends StatefulWidget {
  Employee _employee;
  int _responsive ;
  SelectDepartmentScreen(this._employee,this._responsive);

  @override
  _SelectDepartmentScreenState createState() => _SelectDepartmentScreenState(_employee,_responsive);
}

class _SelectDepartmentScreenState extends State<SelectDepartmentScreen> {
  Employee _employee;
  int _responsive ;
  _SelectDepartmentScreenState(this._employee,this._responsive);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Color(0xFF4B53F5)
        ),
        title:Text('Select Department',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.black)
          ,),
        elevation: 1,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body:  StreamBuilder<QuerySnapshot>(
          stream: FbFirestoreController().getDepartments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasData && snapshot.data!.docs.isNotEmpty){
              List<QueryDocumentSnapshot> data = snapshot.data!.docs;
              return ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),        itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 30,
                          child: Icon(Icons.person, color: Color(0XFF4B53F5))),
                      title: Text(data[index].get('title')),
                      onTap: () async => await _openToSelectEmployee(
                        title: data[index].get('title'),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index){
                  return SizedBox();
                },
              );
            }else{
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.warning,size: 85,color: Colors.grey.shade500,),
                    Text('No Data',style: TextStyle(color: Colors.grey.shade500,fontSize: 18,fontWeight: FontWeight.bold),)
                  ],
                ),
              );
            }

          }
      ),
    );
  }


  Future<void> _openToSelectEmployee({required String title}) async{
    _employee.department = title;
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddEmployeeScreen(_employee,_responsive)));
  }


}
