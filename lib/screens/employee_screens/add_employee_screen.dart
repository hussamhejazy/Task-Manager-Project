import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
import 'package:task_manager/models/Employee.dart';
import 'package:task_manager/screens/employee_screens/select_department_employee_screen.dart';
import 'package:task_manager/utils/helpers.dart';

import 'employee_screen.dart';
class AddEmployeeScreen extends StatefulWidget {
  Employee _employee;
  int _responsive ;
  AddEmployeeScreen(this._employee,this._responsive);

  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState(_employee,_responsive);
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> with Helpers{
  Employee _employee;
  int _responsive ;
  _AddEmployeeScreenState(this._employee,this._responsive);

  late TextEditingController _nameEditingControllertiti;
  late TextEditingController _emailEditingControllertiti;
  late TextEditingController _passwordEditingControllertiti;

  @override
  void initState() {
    super.initState();
    _nameEditingControllertiti = TextEditingController();
    _emailEditingControllertiti= TextEditingController();
    _passwordEditingControllertiti= TextEditingController();
  }

  @override
  void dispose() {
    _nameEditingControllertiti.dispose();
    _emailEditingControllertiti.dispose();
    _passwordEditingControllertiti.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    fillField();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Color(0xFF4B53F5)
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          (_responsive==1)?'Save Employees':'Add Employees',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _nameEditingControllertiti,
                decoration: InputDecoration(
                  hintText: 'name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailEditingControllertiti,
                decoration: InputDecoration(
                  hintText: 'email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _passwordEditingControllertiti,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  hintText:'password',
                 // prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  child: Icon(Icons.workspaces_filled,color: Color(0xFF4B53F5),),
                ),
                title: Text(
                  'Department',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  _employee.department,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF4B53F5),
                ),
                onTap: () async => await _goScreenDepartment(),
              ),
              ElevatedButton(
                onPressed: () async {
                  if(_responsive==0){
                    await performSave();
                  }else  if(_responsive==1){
                    await performUpdate(id:_employee.path);
                  }

                } ,
                child: Text((_responsive==1)?'Edit':'Added',),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }

  Future<void> performSave() async{
    if(checkData()){
      save();
    }
  }

  Future<void> performUpdate({required String id}) async{
    if(checkData()){
      update(id:id);
    }
  }


  bool checkData(){
    if(_nameEditingControllertiti.text.isNotEmpty &&
        _emailEditingControllertiti.text.isNotEmpty&&
        _passwordEditingControllertiti.text.isNotEmpty&&
        _employee.department != 'Not Selected'){
      return true;
    }
    showSnackBar(context: context, content: 'Enter required data',error: true);
    return false;
  }

  Future<void> save() async{
    bool status = await FbFirestoreController().CreateEmployee(employee: _employee);
    if (status){
      showSnackBar(context: context, content: 'Employee Added Successfully');
      cleare();
    }
  }

  Future<void> update({required String id}) async{
    _employee.name = _nameEditingControllertiti.text;
    _employee.email = _emailEditingControllertiti.text;
    _employee.password = _passwordEditingControllertiti.text;
    bool status = await FbFirestoreController().updateEmployee(employee: _employee,path:id);
    if (status){
      showSnackBar(context: context, content: 'Employee updated Successfully');
      cleare();
    }
  }



  void cleare(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>EmployeeScreen()));
  }

  Employee get employee{
    Employee employee = Employee();
    if(_responsive == 1){
      employee.path = _employee.path;
    }
    employee.name = _nameEditingControllertiti.text;
    employee.email = _emailEditingControllertiti.text;
    employee.password = _passwordEditingControllertiti.text;
    employee.department = _employee.department;
    return employee;
  }
  void fillField(){
    _nameEditingControllertiti.text = _employee.name;
    _emailEditingControllertiti.text = _employee.email;
    _passwordEditingControllertiti.text = _employee.password;
  }
  Future<void> _goScreenDepartment() async{
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelectDepartmentScreen(employee,_responsive)));
  }


}
