import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';

class ShowEmployeeByDepartmentScreen extends StatefulWidget {
  String _titleDepartment;
  ShowEmployeeByDepartmentScreen(this._titleDepartment);

  @override
  _ShowEmployeeByDepartmentScreenState createState() => _ShowEmployeeByDepartmentScreenState(_titleDepartment);
}

class _ShowEmployeeByDepartmentScreenState extends State<ShowEmployeeByDepartmentScreen> {
  String _titleDepartment;

  _ShowEmployeeByDepartmentScreenState(this._titleDepartment);

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
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body:  StreamBuilder<QuerySnapshot>(
          stream: FbFirestoreController().getEmployees(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasData && snapshot.data!.docs.isNotEmpty){
              List<QueryDocumentSnapshot> data = snapshot.data!.docs;
              for(var i = 0; i < data.length;i++){
                if (data.length > 0 && data[i].get('department') == _titleDepartment){
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    itemCount: data.length,
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
                          ),
                        );
                      }
                      else{
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
              return SizedBox();
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
}
