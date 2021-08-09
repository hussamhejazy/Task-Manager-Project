import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/models/Department.dart';
import 'package:task_manager/models/Employee.dart';
import 'package:task_manager/models/Task.dart';
import 'package:task_manager/models/user.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();
  late SharedPreferences _sharedPreferences;

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setString('email', user.email);
    await _sharedPreferences.setString('name', user.name);
  }

  User get user {
    return User(
      name: _sharedPreferences.getString('name') ?? '',
      email: _sharedPreferences.getString('email') ?? '',
    );
  }

  bool get loggedIn => _sharedPreferences.getBool('logged_in') ?? false;

  Future<bool> logout() async {
    // return await _sharedPreferences.remove('key');
    return await _sharedPreferences.clear();
  }

  Future<void> saveTask({required Task task}) async {
    await _sharedPreferences.setString('titleTask', task.title);
    await _sharedPreferences.setString('dateTask', task.date);
    await _sharedPreferences.setString('timeTask', task.time);
    await _sharedPreferences.setString('noteTask', task.note);
  }
  Task getTask(){
    Task task = Task();
    task.title =_sharedPreferences.getString('titleTask')!;
    task.date =_sharedPreferences.getString('dateTask')!;
    task.time =_sharedPreferences.getString('timeTask')!;
    task.note =_sharedPreferences.getString('noteTask')!;
    return task;
  }
  Future<bool> clearTask() async {
    return await _sharedPreferences.remove('titleTask')&&
        await _sharedPreferences.remove('dateTask')&&
        await _sharedPreferences.remove('timeTask')&&
        await _sharedPreferences.remove('noteTask');
  }



  Future<void> saveEmployee({required Employee employee}) async {
    await _sharedPreferences.setString('nameEmployee', employee.name);
    await _sharedPreferences.setString('emailEmployee', employee.email);
    await _sharedPreferences.setString('passwordEmployee', employee.password);
    await _sharedPreferences.setString('departmentEmployee', employee.department);
  }
  Employee getEmployee(){
    Employee employee = Employee();
    employee.name =_sharedPreferences.getString('nameEmployee')!;
    employee.email =_sharedPreferences.getString('emailEmployee')!;
    employee.password =_sharedPreferences.getString('passwordEmployee')!;
    employee.department =_sharedPreferences.getString('departmentEmployee')!;
    return employee;
  }
  Future<bool> clearEmployee() async {
    return await _sharedPreferences.remove('nameEmployee')&&
        await _sharedPreferences.remove('emailEmployee')&&
        await _sharedPreferences.remove('passwordEmployee')&&
        await _sharedPreferences.remove('departmentEmployee');
  }



  Future<void> saveDepartment({required Department department}) async {
    await _sharedPreferences.setString('titleDepartment', department.title);
  }
  Department getDepartment(){
    Department department = Department();
    department.title =_sharedPreferences.getString('titleDepartment')!;
    return department;
  }
  Future<bool> clearDepartment() async {
    // return await _sharedPreferences.remove('key');
    return await _sharedPreferences.remove('titleDepartment');
  }

}
