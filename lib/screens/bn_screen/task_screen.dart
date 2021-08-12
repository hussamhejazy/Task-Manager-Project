import 'package:flutter/material.dart';
import 'package:task_manager/models/Task.dart';
import 'package:task_manager/screens/nb_screens/pk_task_screen/add_task_screen.dart';
import 'package:task_manager/screens/nb_screens/pk_task_screen/taskList.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 0,
          elevation: 0,
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xFF4B53F5), width: 1)),
            indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
            tabs: [
              Tab(text: 'New Task'),
              Tab(text: 'In Progress'),
              Tab(text: 'Done')
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            TaskList( status: 0),
            TaskList( status: 1),
            TaskList( status: 2),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Task _task = Task();
            _task.title = 'Select Duty';
            _task.date = 'Date';
            _task.time = 'Time';
            _task.nameEmployee = 'Employee Name';
            _task.emailEmployee = 'Email';
            _task.note = '';
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTask(_task)));
          },
          child: Icon(Icons.add),
        ));
  }

}
