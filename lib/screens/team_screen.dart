import 'package:flutter/material.dart';
class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Color(0xFF4B53F5)
        ),
        title: Text(
          'Team',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
    body:GridView(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 15,
    crossAxisSpacing: 15,
    childAspectRatio: 100 / 94),
      children: [
        buildElevatedButton(context,iconImage: 'images/profile.png',label: 'Jonathan Doe',subtitle: 'UI Designer'),
        buildElevatedButton(context,iconImage: 'images/teamfirst.png',label: 'Steven Kim',subtitle: 'UI Designer'),
        buildElevatedButton(context,iconImage: 'images/teamtwo.png',label: 'Lidya Marry',subtitle: 'UI Designer'),
        buildElevatedButton(context,iconImage: 'images/profile.png',label: 'Sebastian Loeb',subtitle: 'UI Designer'),
      ],
    )
    );

  }
  ElevatedButton buildElevatedButton(BuildContext context,{ required String iconImage, required String label,required String subtitle}) {
    return ElevatedButton(
      onPressed: () {
       // Navigator.pushNamed(context, route);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconImage),
          SizedBox(width: 10,),
          Text(label,style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
          SizedBox(width: 10,),

          Text(label,style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: Colors.black
          ),),
        ],
      ),
      style: ElevatedButton.styleFrom(
          primary: Color(0xFFFFFFFF),
          elevation: 1
      ),
    );
  }


}
