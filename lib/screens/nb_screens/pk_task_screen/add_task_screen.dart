import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
import 'package:task_manager/models/Task.dart';
import 'package:task_manager/utils/helpers.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> with Helpers {
  DateTime? _date;
  TimeOfDay? _time;
  late TextEditingController _titleEditingController;
  late TextEditingController _noteEditingController;

  @override
  void initState() {
    super.initState();
    _titleEditingController = TextEditingController();
    _noteEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _titleEditingController.dispose();
    _noteEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF4B53F5)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Add Task",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              maxLength: 55,
              controller: _titleEditingController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4B53F5))),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4B53F5))),
                counterText: '',
                labelText: 'Task',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
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
                            _getDate,
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
                            _getTime(),
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
                backgroundColor: Color(0xFF4B53F5),
                //backgroundImage: ,
                radius: 25,
              ),
              title: Text(
                  'name',
                  style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                  'email',
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
              onPressed: () async => await performSave(),
              child: Text(
                'Send',
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
      ),
    );
  }




  Future _pickDate(BuildContext context) async {
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
      (_date == null) ? 'Date' : '${_date!.year}/${_date!.month}/${_date!.day}';

  Future _pickTime(BuildContext context) async {
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
      return 'Time';
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
    await Navigator.pushNamed(context, '/select_employee_screen');
  }

  Future<void> performSave() async {
    if (checkData()) {
      save();
    }
  }

  bool checkData() {
    if (_titleEditingController.text.isNotEmpty &&
        _noteEditingController.text.isNotEmpty &&
        _date != null &&
        _time != null) {
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

  Task get task {
    Task task = Task();
    task.title = _titleEditingController.text;
    task.date = _getDate;
    task.time = _getTime();
    task.note = _noteEditingController.text;
    return task;
  }

  void clear() {
    Navigator.pop(context);
  }
}
