import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
import 'package:task_manager/models/Employee.dart';
import 'package:task_manager/utils/helpers.dart';
class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> with Helpers{

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Color(0xFF4B53F5)
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Add Employees',
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
                  //prefixIcon: Icon(Icons.email),
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
                  //prefixIcon: Icon(Icons.email),
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
              ElevatedButton(
                onPressed: () async => await performSave(),
                child: Text('Added'),
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

  bool checkData(){
    if(_nameEditingControllertiti.text.isNotEmpty &&
        _emailEditingControllertiti.text.isNotEmpty&&
        _passwordEditingControllertiti.text.isNotEmpty){
      return true;
    }
    showSnackBar(context: context, content: 'Enter required data',error: true);
    return false;
  }

  Future<void> save() async{
    bool status = await FbFirestoreController().CreateEmployee(employee: employee);
    if (status){
      showSnackBar(context: context, content: 'Employee Added Successfully');
      cleare();
    }
  }

  Employee get employee{
    Employee employee = Employee();
    employee.name = _nameEditingControllertiti.text;
    employee.email = _emailEditingControllertiti.text;
    employee.password = _passwordEditingControllertiti.text;
    return employee;
  }

  void cleare(){
    _nameEditingControllertiti.text = '';
    _emailEditingControllertiti.text = '';
    _passwordEditingControllertiti.text = '';
  }
}
