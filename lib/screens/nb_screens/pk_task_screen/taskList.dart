import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
import 'package:task_manager/models/Task.dart';
import 'package:task_manager/preferences/app_preferences.dart';
import 'package:task_manager/screens/nb_screens/pk_task_screen/task_detail_screen.dart';

class TaskList extends StatelessWidget {

  final int status ;


   TaskList({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: StreamBuilder<QuerySnapshot>(
          stream: FbFirestoreController().getTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasData && snapshot.data!.docs.isNotEmpty){
              List<QueryDocumentSnapshot> data = snapshot.data!.docs;
              return ListView.separated(
                itemBuilder: (context,index){
                  if (data[index].get('status') == status){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        child: ListTile(
                          leading: getIcon(data[index].get('status')),
                          title: Text(data[index].get('title')),
                          subtitle: Text('${data[index].get('date')}   ${data[index].get('time')}'),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskDetail(
                                saveIntoSharedPreferences(
                                  path: data[index].id,
                                  title: data[index].get('title'),
                                  date: data[index].get('date'),
                                  time: data[index].get('time'),
                                  employeeName: data[index].get('nameEmployee'),
                                  employeeEmail: data[index].get('emailEmployee'),
                                  note: 'hussam zyad hejazy',
                                  // data[index].get('note')
                                )
                            )));
                          },
                        ),
                      ),
                    );
                  }
                  else{
                    return Divider();
                  }
                }
                ,itemCount: data.length,
              separatorBuilder: (context,index){
                  return Divider();
              },);
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
      ),
    );
  }
  Icon getIcon(int status){
    switch(status){
      case 0: return Icon(Icons.circle,color: Color(0xFF4B53F5));
      case 1: return Icon(Icons.update,color: Color(0xFF4B53F5));
      case 2: return Icon(Icons.check,color:Color(0xFF4B53F5));
    }
    return Icon(Icons.arrow_forward_ios_rounded,color: Color(0xFF4B53F5));
  }

  Task saveIntoSharedPreferences({
    required String path,
    required String title,
    required String date,
    required String time,
    required String employeeName,
    required String employeeEmail,
    required String note,
  }){
    Task task = Task();
    task.path = path;
    task.title = title;
    task.date = date;
    task.time = time;
    task.nameEmployee = employeeName;
    task.emailEmployee = employeeEmail;
    task.note = note;

    return task;
  }
}

