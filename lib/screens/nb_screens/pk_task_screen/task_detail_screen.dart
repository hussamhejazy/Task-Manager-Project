import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
import 'package:task_manager/models/Task.dart';
import 'package:task_manager/preferences/app_preferences.dart';
import 'package:task_manager/utils/helpers.dart';



class TaskDetail extends StatefulWidget {
  Task _task;
  TaskDetail(this._task);
  @override
  _TaskDetailState createState() => _TaskDetailState(_task);
}

class _TaskDetailState extends State<TaskDetail> with Helpers{


  Task _task;
  int _countState = 0;
  String _nameState = 'Idel';
  _TaskDetailState(this._task);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF4B53F5)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Task Detail",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              clipBehavior: Clip.antiAlias,
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFFDF8D7),
                  boxShadow: [
                    BoxShadow(
                        color: Color(000000).withOpacity(0.1), blurRadius: 6)
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Visibility(
                            visible: true,
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            child: Container(
                              color: Color(0xFFFFF196),
                              height: double.infinity,
                              width: 10,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _nameState,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (_countState==0){
                          _countState = 1;
                          _nameState = 'In Progress';
                        }else  if (_countState==1){
                          _countState = 2;
                          _nameState = 'Done';
                        } else if (_countState==2){
                          _countState = 0;
                          _nameState = 'Idel';
                        }
                      });
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Text('Task',style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),),
            Text(_task.title,style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),),
            SizedBox(height: 20,),
            Text('Deo Date',style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),),
            Text('${_task.date}  ${_task.time}',style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),),
            SizedBox(height: 20,),
            Text('Assigned to',style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(Icons.person,color: Color(0xFF4B53F5),),
              title: Text(_task.nameEmployee,style: TextStyle(fontSize: 16),),
              subtitle: Text(_task.emailEmployee,style: TextStyle(fontSize: 14,color: Colors.grey),),
            ),
            SizedBox(height: 30,),
            Text('Note',style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),),
            Text(_task.note,style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () async => await update(
              status: _countState,
            )
              , child: Text('Save',style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFF4B53F5),
                  minimumSize: Size(double.infinity, 50)
              ),
            )

          ],
        ),
      ),
    );
  }

  Future<void> update ({

    required int status,
  }) async{
    _task.status = status;
    await updateTask(path: _task.path, task: _task);
    Navigator.pop(context);

  }

  Future<void> updateTask({required String path,required Task task}) async {
    bool status = await FbFirestoreController().updateTask(path: path,task: task);
    if (status) {
      showSnackBar(context: context, content: 'Task Updated Successfully');
    }
  }
}
