import 'Employee.dart';

class Task{
   late String title;
   //deadLine
   late String date;
   late String time;
   late String nameEmployee = 'Employee Name';
   late String emailEmployee = 'Email';
   late String note;


  /*
  * status 0 = this task ideal
  * status 1 = this task in progress
  * status 2 = this task is done
  * */
   late int status = 0;

   Task();
   Task.fromMap(Map<String,dynamic> map){
     title = map['title'];
     date = map['date'];
     time = map['time'];
     nameEmployee = map['nameEmployee'];
     emailEmployee = map['emailEmployee'];
     status = map['status'];
   }

   Map<String,dynamic>  toMap(){
     Map<String,dynamic> map = Map<String,dynamic>();
     map['title'] = title;
     map['date'] = date;
     map['time'] = time;
     map['nameEmployee'] = nameEmployee;
     map['emailEmployee'] = emailEmployee;
     map['status'] = status;
     return map;
   }



}