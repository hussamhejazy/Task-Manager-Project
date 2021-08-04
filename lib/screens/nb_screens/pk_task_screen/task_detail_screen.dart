import 'package:flutter/material.dart';

class TaskDetail extends StatefulWidget {
  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  int _countState = 0;
  String _nameState = 'Idel';
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
            Text('Create new payment method yo our apps',style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),),
            SizedBox(height: 20,),
            Text('Deo Date',style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),),
            Text('20 jun 2021',style: TextStyle(
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
              leading: CircleAvatar(
                backgroundColor: Color(0xFF4B53F5),
                //backgroundImage: ,
                radius: 25,
              ),
              title: Text('hussam hejazy',style: TextStyle(fontSize: 16),),
              subtitle: Text('Department',style: TextStyle(fontSize: 14,color: Colors.grey),),
              trailing: IconButton(onPressed: (){
                //todo// open employees page to select
              },icon:Icon(Icons.arrow_forward,color: Color(0xFF4B53F5),),),
            ),
            SizedBox(height: 30,),
            Text('Note',style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),),
            Text('User need new specific payment method to suscribe our apps',style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){}, child: Text('Save',style: TextStyle(
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
}
