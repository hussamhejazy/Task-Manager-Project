class Employee{
  late String name;
  late String email;
  late String password;
  late String department = 'Not Selected';


  Employee();
  Employee.fromMap(Map<String,dynamic> map){
    name = map['name'];
    email = map['email'];
    password = map['password'];
    department = map['department'];
  }
  Map<String,dynamic>  toMap(){
    Map<String,dynamic> map = Map<String,dynamic>();
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['department'] = department;
    return map;
  }
}