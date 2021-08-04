import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color:  Color(0xFF4B53F5)
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Add Task",style: TextStyle(
          color: Colors.black
        ),),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            TextField(
              maxLength: 55,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4B53F5)
                  )
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF4B53F5)
                    )
                ),
                counterText: '',
                labelText: 'Task',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              maxLength: 55,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF4B53F5)
                    )
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF4B53F5)
                    )
                ),
                counterText: '',
                labelText: 'Deo Date',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
            SizedBox(height: 30,),
            Text('Assigned to',style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                backgroundColor: Color(0xFF4B53F5),
                //backgroundImage: ,
                radius: 25,
              ),
              title: Text('hussam hejazy',style: TextStyle(fontSize: 16),),
              subtitle: Text('Department',style: TextStyle(fontSize: 14,color: Colors.grey),),
              trailing: IconButton(onPressed: (){},icon:Icon(Icons.arrow_forward,color: Color(0xFF4B53F5),),),
            ),
            SizedBox(height: 20,),
            TextField(
              style: TextStyle(fontSize: 16),
              maxLength:200,
              minLines: 2,
              maxLines: 5,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF4B53F5)
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFF4B53F5)
                    )
                ),
                counterText: '',
                labelText: 'Note',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){}, child: Text('Send',style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            ),
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
