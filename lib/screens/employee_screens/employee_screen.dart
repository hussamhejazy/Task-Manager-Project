import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
import 'package:task_manager/models/Employee.dart';
import 'package:task_manager/screens/employee_screens/add_employee_screen.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF4B53F5)),
        title: Text(
          'Employees',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 21, color: Colors.black),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pushReplacementNamed(context, '/main_screen');
        },icon:Icon(Icons.arrow_back_rounded)),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddEmployeeScreen(_employee, 0)));
            },
            icon: Icon(Icons.add),
            iconSize: 30,
            color: Color(0XFF4B53F5),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FbFirestoreController().getEmployees(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> data = snapshot.data!.docs;
              return ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 30,
                          child: Icon(Icons.person, color: Color(0XFF4B53F5))),
                      title: Text(data[index].get('name')),
                      subtitle: Text(data[index].get('email')),
                      trailing: IconButton(
                        onPressed: () async =>
                            await _performDelete(path: data[index].id),
                        icon: Icon(
                          Icons.delete,
                          color: Color(0XFF4B53F5),
                        ),
                      ),
                      onTap: () async => await _goEditEmployee(
                          path: data[index].id,
                          name: data[index].get('name'),
                          email: data[index].get('email'),
                          department: data[index].get('department')),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox();
                },
              );
            } else {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.warning,
                      size: 85,
                      color: Colors.grey.shade500,
                    ),
                    Text(
                      'No Data',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }

  Employee get _employee {
    Employee employee = Employee();
    employee.name = '';
    employee.email = '';
    employee.password = '';
    return employee;
  }

  Future<void> _performDelete({required String path}) async {
    await FbFirestoreController().deleteEmployee(path: path);
  }

  Future<void> _goEditEmployee(
      {required String path,
      required String name,
      required String email,
      required String department}) async {
    Employee employee = Employee();
    employee.path = path;
    employee.name = name;
    employee.email = email;
    employee.password = '';
    employee.department = department;
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => AddEmployeeScreen(employee, 1)));
  }
}
