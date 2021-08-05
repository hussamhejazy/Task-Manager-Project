import 'package:flutter/material.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({Key? key}) : super(key: key);

  @override
  _LeaveScreen createState() => _LeaveScreen();
}

class _LeaveScreen extends State<LeaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF4B53F5),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Attendance',
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 1,
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 22),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Leave type',style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.4)),),
                            Text('Vacation',style: TextStyle(fontSize: 14,color: Colors.black.withOpacity(0.7)),)
                          ],
                        ),
                        _requestStatus(status: index)
                      ],
                    ),
                    SizedBox(height: 14,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Start',style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.4)),),
                            Text('01 Feb 2021',style: TextStyle(fontSize: 14,color: Colors.black.withOpacity(0.7)),)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('End',style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.4)),),
                            Text('04 Feb 2021',style: TextStyle(fontSize: 14,color: Colors.black.withOpacity(0.7)),)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Status',style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.4)),),
                            Text('Paid Leave',style: TextStyle(fontSize: 14,color: Colors.black.withOpacity(0.7)),)
                          ],
                        )
                      ],
                    ),
                    Divider(height: 30,)
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }
}


Widget _requestStatus({required int status}){
  String reqStatus = 'Waiting to Approve';
  Color fillColor = Color(0xFFFDF8D7);
  Color borderColor = Color(0xFFFFF196);
  if (status == 0){
    reqStatus = 'Rejected';
    fillColor = Color(0xFFFDD7D7);
    borderColor = Color(0xFFFF9696);
  }else if(status == 1){
    reqStatus = 'Approved';
    fillColor = Color(0xFFD7FDDB);
    borderColor = Color(0xFF96FF96);
  }

  return Container(
    decoration: BoxDecoration(
        color: fillColor,
        border: Border.all(color: borderColor)
    ),

    child: Padding(
      padding: const EdgeInsets.all(6),
      child: Text(reqStatus,style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.7)),),
    ),
  );

}