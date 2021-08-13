import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_auth_controller.dart';
import 'package:task_manager/preferences/app_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late User user;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 36),
          child: ListView(
            children: [
              ListTile(
                onTap: () async{
                  await signOut();
                },
                leading: Icon(Icons.logout,color:Color(0xFF4B53F5) ),
                title: Text('Logout'),
              ),
              ListTile(
                onTap: () async{
                 await Navigator.pushNamed(context, '/account_screen');

                },
                leading: Icon(Icons.person_outline,color:Color(0xFF4B53F5) ),
                title: Text('Account'),
              ),
              ListTile(
                onTap: () {
                },
                leading: Icon(Icons.language,color:Color(0xFF4B53F5) ,),
                title: Text('Language'),
              ),
              //buildElevatedButton(context,route:'',icon: Icon(Icons.person_outline,color: Color(0xFF4B53F5),),title: 'Account'),
              //buildElevatedButton(context,route:'',icon: Icon(Icons.language,color: Color(0xFF4B53F5),),title: 'Language'),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context,{required String route,required Icon icon,required String title}) {
    return ElevatedButton(onPressed: (){
      Navigator.pushNamed(context, route);
    }, child: Row(
      children: [
        icon,
        SizedBox(width: 16,),
        Text(title,style: TextStyle(
            fontSize: 16,
            color: Colors.black
        ),)
      ],
    ),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
      ),
    );
  }
  Future<void> signOut() async {
    await FbAuthController().signOut();
    Navigator.pushReplacementNamed(context, '/login_screen');
  }

}



