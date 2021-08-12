import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
import 'package:task_manager/models/Task.dart';

import 'add_task_screen.dart';

class SelectEmployee extends StatefulWidget {
  Task _task;
  String _titleDepartment;
  int _responsive;
  SelectEmployee(this._task,this._titleDepartment,this._responsive);

  @override
  _SelectEmployeeState createState() => _SelectEmployeeState(_task,_task.nameEmployee,_task.emailEmployee,_titleDepartment,_responsive);
}

class _SelectEmployeeState extends State<SelectEmployee> {
  int _responsive;
  Task _task;
  String _employeeName ;
  String _employeeEmail ;
  String _titleDepartment;
  _SelectEmployeeState(this._task,this._employeeName,this._employeeEmail,this._titleDepartment,this._responsive);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Color(0xFF4B53F5)
        ),
        title:Text('Select Employee',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.black)
          ,),
        elevation: 1,
        leading: IconButton(onPressed: (){
          _goScreen(
            name: _employeeName,
            email: _employeeEmail
          );
        },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body:  StreamBuilder<QuerySnapshot>(
          stream: FbFirestoreController().getEmployees(),
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
                  if(data[index].get('department') == _titleDepartment){
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30,
                            child: Icon(Icons.person, color: Color(0XFF4B53F5))),
                        title: Text(data[index].get('name')),
                        subtitle: Text(data[index].get('email')),
                        onTap: () async => await _select(
                          name: data[index].get('name'),
                          email: data[index].get('email'),
                        ),
                      ),
                    );
                  }else{
                    return SizedBox();
                  }

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

  Future<void> _select({required String name,required String email}) async{
    _employeeName = name;
    _employeeEmail = email;
   await _goScreen(
     name: _employeeName,
     email: _employeeEmail
   );
  }


  Future<void> _goScreen({required String name,required String email})async{
    _task.nameEmployee = name;
    _task.emailEmployee = email;
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddTask(_task,_responsive)));
  }

}
