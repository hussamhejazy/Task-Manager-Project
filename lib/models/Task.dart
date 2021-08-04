class Task{
   String title;
   String deadLine;

  /*
  * status 0 = this task ideal
  * status 1 = this task in progress
  * status 2 = this task is done
  * */
   int status;


  Task({ required this.title, required this.deadLine,required this.status});
}