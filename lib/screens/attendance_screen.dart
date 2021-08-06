import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Attendance',
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 1,
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Color(0xFF4B53F5),),),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 22),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Today, 23 January 2021',style: TextStyle(fontSize: 14),),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Check-in',style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.4)),),
                            SizedBox(width: 40,),
                            Text('Check-in',style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.4)),)
                          ],
                        ),
                        Row(
                          children: [
                            RichText(text: TextSpan(
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF239E00)
                              ),
                              text: '09.30',
                              children: <InlineSpan>[
                                TextSpan(
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black.withOpacity(0.7),
                                  ),
                                  text: '  AM'
                                )
                              ]
                            )),
                            SizedBox(width: 40,),
                            RichText(text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFE21313)
                                ),
                                text: '09.30',
                                children: <InlineSpan>[
                                  TextSpan(
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                      text: '  PM'
                                  )
                                ]
                            )),
                          ],
                        ),
                        SizedBox(height: 14,),
                        Text('Location',style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.4)),),
                        Text('8 S Jefferson St, New Ulm, MN, 56073',style: TextStyle(fontSize: 14),),
                        Divider(height: 30,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
