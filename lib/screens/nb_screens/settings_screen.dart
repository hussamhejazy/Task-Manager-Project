import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 36),
          child: ListView(
            children: [
              buildElevatedButton(icon: Icon(Icons.person_outline,color: Color(0xFF4B53F5),),title: 'Account'),
              buildElevatedButton(icon: Icon(Icons.logout,color: Color(0xFF4B53F5),),title: 'Log out'),
              buildElevatedButton(icon: Icon(Icons.language,color: Color(0xFF4B53F5),),title: 'Language'),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton({required Icon icon,required String title}) {
    return ElevatedButton(onPressed: (){}, child: Row(
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
}
