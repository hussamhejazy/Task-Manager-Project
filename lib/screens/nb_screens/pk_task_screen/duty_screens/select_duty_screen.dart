import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
import 'package:task_manager/models/Task.dart';

import '../add_task_screen.dart';


class SelectDutyScreen extends StatefulWidget {

  Task _task;
  int _responsive;

  SelectDutyScreen(this._task,this._responsive);

  @override
  _SelectDutyScreenState createState() => _SelectDutyScreenState(_task,_task.title,_responsive);
}

class _SelectDutyScreenState extends State<SelectDutyScreen> {
  Task _task;
  String _title;
  int _responsive;
  _SelectDutyScreenState(this._task,this._title,this._responsive);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Color(0xFF4B53F5)
        ),
        title:Text('Select Duty',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.black)
          ,),
        elevation: 1,
        leading: IconButton(onPressed: (){
          _goScreen(title: _title);
        },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/add_duty_screen');
          },
              icon: Icon(Icons.add)
          ),
        ],
      ),
      body:  StreamBuilder<QuerySnapshot>(
          stream: FbFirestoreController().getDuty(),
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
                          child: Icon(Icons.assignment_turned_in_outlined, color: Color(0XFF4B53F5))),
                      title: Text(data[index].get('title')),
                      trailing: IconButton(
                          onPressed: () async => await performDelete(path: data[index].id),
                          icon: Icon(Icons.delete, color: Color(0XFF4B53F5))),
                      onTap: () async => await _select(
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



  Future<void> _select({required String title}) async{
    _title = title;
    await _goScreen(
        title: title,
    );
  }


  Future<void> _goScreen({required String title})async{
    _task.title = title;
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddTask(_task,_responsive)));
  }

  Future<void> performDelete({required String path})async{
    await FbFirestoreController().deleteDuty(path: path);
  }
}
