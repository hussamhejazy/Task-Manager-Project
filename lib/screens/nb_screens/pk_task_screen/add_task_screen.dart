import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
import 'package:task_manager/models/Task.dart';
import 'package:task_manager/screens/nb_screens/pk_task_screen/select_department_task_screen.dart';
import 'package:task_manager/screens/nb_screens/pk_task_screen/duty_screens/select_duty_screen.dart';
import 'package:task_manager/utils/helpers.dart';
import '../../main_screen.dart';

class AddTask extends StatefulWidget {
  Task _task;
  int _responsive ;
  AddTask(this._task,this._responsive);

  @override
  _AddTaskState createState() => _AddTaskState(_task,_responsive);
}

class _AddTaskState extends State<AddTask> with Helpers {
  Task _task;
  int _responsive ;
  _AddTaskState(this._task,this._responsive);
  DateTime? _date;
  TimeOfDay? _time;
  late TextEditingController _noteEditingController;

  @override
  void initState() {
    super.initState();
    _noteEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _noteEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fillField();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF4B53F5)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          (_responsive == 0)?'Add Task':'Edit Task',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MainScreen()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 25,
                    child: Icon(Icons.assignment,color: Color(0xFF4B53F5),),
                  ),
                  title: Text(
                    'Task',
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    _task.title,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF4B53F5),
                  ),
                  onTap: () async => await  _goScreenDuty(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 157,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (_responsive == 0)?_getDate:_task.date,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.9)),
                              ),
                              IconButton(
                                onPressed: () {
                                  _pickDate(context);
                                },
                                icon: Icon(
                                  Icons.date_range,
                                  color: Color(0xFF4B53F5),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 157,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (_responsive == 0)?_getTime():_task.time,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.9)),
                              ),
                              IconButton(
                                onPressed: () {
                                  _pickTime(context);
                                },
                                icon: Icon(
                                  Icons.access_time_outlined,
                                  color: Color(0xFF4B53F5),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 5,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Assigned to',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 25,
                    child: Icon(Icons.person,color: Color(0xFF4B53F5),),
                  ),
                  title: Text(
                    _task.nameEmployee,
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    _task.emailEmployee,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF4B53F5),
                  ),
                  onTap: () async => await _selectEmployee(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(fontSize: 16),
                  maxLength: 200,
                  minLines: 2,
                  maxLines: 5,
                  controller: _noteEditingController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4B53F5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4B53F5))),
                    counterText: '',
                    labelText: 'Note',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async => await (_responsive == 0)?performSave():performUpdate(),
                  child: Text(
                    (_responsive == 0)?'Send':'Edit',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF4B53F5),
                      minimumSize: Size(double.infinity, 50)),
                )
              ],
            ),
          ],
        )

      ),
    );
  }




  Future _pickDate(BuildContext context) async {
    _task.note = _noteEditingController.text;
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => _date = newDate);
    return _date;
  }

  String get _getDate =>
      (_date == null) ? _task.date : '${_date!.year}/${_date!.month}/${_date!.day}';

  Future _pickTime(BuildContext context) async {
    _task.note = _noteEditingController.text;
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: _time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => _time = newTime);

    return _time;
  }

  String _getTime() {
    if (_time == null) {
      return _task.time;
    } else {
      final h = _time!.hour.toString().padLeft(2, '0');
      final m = _time!.minute.toString().padLeft(2, '0');
      String day = 'AM';
      if (int.parse(h) >= 12) {
        day = 'PM';
      }
      return '$h : $m $day';
    }
  }


  Future<void> _selectEmployee() async {
    await _goScreenDepartment();
  }

  Future<void> performSave() async {
    if (checkData()) {
      save();
    }
  }
  Future<void> performUpdate() async {
    if (checkData()) {
      update();
    }
  }

  bool checkData() {
    if (_task.title!= 'Select Task' &&
        _noteEditingController.text.isNotEmpty &&
        _date != 'Date' &&
        _time != 'Time' &&
    _task.nameEmployee != 'Employee Name'&&
        _task.emailEmployee != 'Email'
    ) {
      return true;
    }
    showSnackBar(context: context, content: 'Enter required data', error: true);
    return false;
  }

  Future<void> save() async {
    bool status = await FbFirestoreController().CreateTask(task: task);
    if (status) {
      showSnackBar(context: context, content: 'Task Added Successfully');
      clear();
    }
  }
  Future<void> update() async {
    bool status = await FbFirestoreController().updateTask(path:_task.path, task: task);
    if (status) {
      showSnackBar(context: context, content: 'Task Update Successfully');
      clear();
    }
  }

  Task get task {
    Task task = Task();
    task.title = _task.title;
    task.date = _getDate;
    task.time = _getTime();
    task.nameEmployee = _task.nameEmployee;
    task.emailEmployee = _task.emailEmployee;
    task.note = _noteEditingController.text;
    return task;
  }

  void clear() {
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MainScreen()));
  }

  void fillField(){
    _noteEditingController.text = _task.note;
  }

  Future<void> _goScreenDepartment()async{
    Task task = Task();
    task.path = _task.path;
    task.title = _task.title;
    task.date = (_responsive == 0)?_getDate:_task.date;
    task.time = (_responsive == 0)?_getTime():_task.time;
    task.nameEmployee = _task.nameEmployee;
    task.emailEmployee = _task.emailEmployee;
    task.note = _noteEditingController.text;
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelectDepartmentScreen(task,_responsive)));
  }

  Future<void> _goScreenDuty()async{
    Task task = Task();
    task.path = _task.path;
    task.title = _task.title;
    task.date = (_responsive == 0)?_getDate:_task.date;
    task.time = (_responsive == 0)?_getTime():_task.time;
    task.nameEmployee = _task.nameEmployee;
    task.emailEmployee = _task.emailEmployee;
    task.note = _noteEditingController.text;
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelectDutyScreen(task,_responsive)));
  }
}
