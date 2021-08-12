import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
import 'package:task_manager/models/Task.dart';
import 'package:task_manager/screens/nb_screens/pk_task_screen/add_task_screen.dart';
import 'package:task_manager/utils/helpers.dart';

class TaskList extends StatefulWidget {

  final int status ;


   TaskList({required this.status});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> with Helpers{
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
                  if (data[index].get('status') == widget.status){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        child: ListTile(
                          leading: getIcon(data[index].get('status')),
                          title: Text(data[index].get('title')),
                          subtitle: Text('${data[index].get('date')}   ${data[index].get('time')}'),
                          trailing: IconButton(
                            onPressed: ()async => await _delete(path: data[index].id),
                            icon: Icon(Icons.delete,color: Color(0xFF4B53F5),),),
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context)=> AddTask(
                                    _getTask(
                                        path: data[index].id,
                                        title: data[index].get('title'),
                                        date: data[index].get('date'),
                                        time: data[index].get('time'),
                                        employeeName: data[index].get('nameEmployee'),
                                        employeeEmail: data[index].get('emailEmployee'),
                                        note: data[index].get('note')
                                    ), 1)));
                          },
                        ),
                      ),
                    );
                  }
                  else{
                    return SizedBox();
                  }
                }
                ,itemCount: data.length,
              separatorBuilder: (context,index){
                  return SizedBox();
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

  Task _getTask({
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

  Future<void> _delete({required String path}) async {
    bool status = await FbFirestoreController().deleteTask(path:path);
    if (status) {
      showSnackBar(context: context, content: 'Task Deleted Successfully');
    }
  }
}

// TaskDetail(
// saveInto(
// path: data[index].id,
// title: data[index].get('title'),
// date: data[index].get('date'),
// time: data[index].get('time'),
// employeeName: data[index].get('nameEmployee'),
// employeeEmail: data[index].get('emailEmployee'),
// note: data[index].get('note')
// )
// )


