import 'package:flutter/material.dart';
import 'package:task_manager/models/Task.dart';

class TaskList extends StatelessWidget {
   List<Task> list;
   Function onPressed;
  final int status ;


   TaskList({required this.list,required this.onPressed,required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemBuilder: (context,index){
            if (list[index].status == status){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  child: ListTile(
                    title: Text(list[index].title),
                    subtitle: Text(list[index].deadLine),
                    trailing: IconButton(onPressed: (){onPressed;},icon:getIcon(list[index].status)),
                    onTap: (){
                      Navigator.pushNamed(context, '/task_detail_screen');
                    },
                  ),
                ),
              );
            }
            else{
              return SizedBox();
            }
          }
          ,itemCount: list.length,),
      ),
    );
  }
  Icon getIcon(int status){
    switch(status){
      case 0: return Icon(Icons.arrow_forward_ios_rounded,color: Color(0xFF4B53F5));
      case 1: return Icon(Icons.circle,color: Color(0xFF4B53F5));
      case 2: return Icon(Icons.check,color:Color(0xFF4B53F5));
    }
    return Icon(Icons.arrow_forward_ios_rounded,color: Color(0xFF4B53F5));
  }
}

