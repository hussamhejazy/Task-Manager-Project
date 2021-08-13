import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_firestore_controller.dart';
import 'package:task_manager/models/Department.dart';
import 'package:task_manager/utils/helpers.dart';
class AddDepartmentScreen extends StatefulWidget {
  const AddDepartmentScreen({Key? key}) : super(key: key);

  @override
  _AddDepartmentScreenState createState() => _AddDepartmentScreenState();
}

class _AddDepartmentScreenState extends State<AddDepartmentScreen> with Helpers{

  late TextEditingController _titleEditingControllertiti;

  @override
  void initState() {
    super.initState();
    _titleEditingControllertiti = TextEditingController();
  }

  @override
  void dispose() {
    _titleEditingControllertiti.dispose();
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
          'Add Department',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _titleEditingControllertiti,
                decoration: InputDecoration(
                  hintText: 'Department Name',
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
      ),
    );
  }

  Future<void> performSave() async{
    if(checkData()){
      save();
    }
  }

  bool checkData(){
    if(_titleEditingControllertiti.text.isNotEmpty){
      return true;
    }
    showSnackBar(context: context, content: 'Enter required data',error: true);
    return false;
  }

  Future<void> save() async{
    bool status = await FbFirestoreController().CreateDepartment(department: department);
    if (status){
      showSnackBar(context: context, content: 'Department Added Successfully');
      cleare();
    }
  }

  Department get department{
    Department department = Department();
    department.title = _titleEditingControllertiti.text;
    return department;
  }

  void cleare(){
    _titleEditingControllertiti.text = '';
  }

}
