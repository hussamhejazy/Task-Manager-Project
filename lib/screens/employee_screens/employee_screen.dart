import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Color(0xFF4B53F5)
      ),
      title:Text('Employees',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.black)
      ,),
      elevation: 1,
      actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/add_employee_screen');
          }, icon: Icon(Icons.add)
          ,iconSize: 30,
          color: Color(0XFF4B53F5),),
      ],
    ),
      body: StreamBuilder<QuerySnapshot>(
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
}
