import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 204,
            width: double.infinity,
            color: Color(0xFFBEDDFF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Good Morning,',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Hussam Hejazy',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 33,
                          color: Color(0xFFD5D7FF),
                          child: Center(
                            child: Text('10:00'),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 33,
                          color: Colors.white,
                          child: Center(
                            child: Text('AM'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Image.asset(
                  'images/vector1.png',
                  alignment: AlignmentDirectional.bottomEnd,
                )
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: GridView(
              padding: EdgeInsets.symmetric(horizontal: 27, vertical: 13),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 160 / 94),
              children: [
                buildElevatedButton(context,route:'',iconImage: 'images/employees_icon.png',label: 'Employees'),
                buildElevatedButton(context,route:'',iconImage: 'images/employees_icon.png',label: 'Employees'),
                buildElevatedButton(context,route:'',iconImage: 'images/reportIcon.png',label: 'Employees'),
              ],
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context, {required String route,required String iconImage, required String label}) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(iconImage),
          SizedBox(width: 8,),
          Text(label,style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),)
        ],
      ),
      style: ElevatedButton.styleFrom(
          primary: Color(0xFFFFFFFF),
          elevation: 1
      ),
    );
  }
}
