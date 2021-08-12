class Duty{
  late String title;

  Duty();
  Duty.fromMap(Map<String,dynamic> map){
    title = map['title'];
  }
  Map<String,dynamic>  toMap(){
    Map<String,dynamic> map = Map<String,dynamic>();
    map['title'] = title;
    return map;
  }
}