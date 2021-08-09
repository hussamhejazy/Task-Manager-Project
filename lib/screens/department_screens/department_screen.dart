import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({Key? key}) : super(key: key);

  @override
  _DepartmentScreenState createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Color(0xFF4B53F5)
        ),
        title: Text(
          'Departments',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 21, color: Colors.black),
        ),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_department_screen');
            },
            icon: Icon(Icons.add),
            iconSize: 30,
            color: Color(0XFF4B53F5),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
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
                          child: Icon(Icons.workspaces_filled, color: Color(0XFF4B53F5))),
                      title: Text(data[index].get('title')),
                      trailing: IconButton(onPressed: () async => await performDelete(path: data[index].id),icon: Icon(Icons.delete, color: Color(0XFF4B53F5)),),
                    ),
                  );
                },
                separatorBuilder: (context, index){
                  return Divider();
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

  Future<void> performDelete({required String path})async{
    await FbFirestoreController().deleteDepartment(path: path);
  }
}
