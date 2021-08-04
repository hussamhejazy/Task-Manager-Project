import 'package:flutter/material.dart';
import 'package:task_manager/models/Task.dart';
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
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
            padding: EdgeInsets.symmetric(horizontal: 8),
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
            TaskList(
              list: [
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 0),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 1),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 2),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 0),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 1),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 0)
              ],
              onPressed: () {},
              status: 0,
            ),
            TaskList(
              list: [
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 0),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 1),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 2),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 0),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 1),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 0)
              ],
              onPressed: () {},
              status: 1,
            ),
            TaskList(
              list: [
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 0),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 1),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 2),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 0),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 1),
                Task(
                    title: 'Payment Method',
                    deadLine: 'Deadline 20 January ',
                    status: 0)
              ],
              onPressed: () {},
              status: 2,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add_task_screen');
          },
          child: Icon(Icons.add),
        ));
  }
}
