import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/models/Task.dart';

class RequestsNotification extends StatelessWidget {
  final int status;

  RequestsNotification(
      {required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      maxRadius:25,
                      backgroundColor: Colors.green,
                    ),
                    title: Text(
                      'hussam hejazy',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    subtitle: Text(
                      'Mobile Programmer',
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.7)),
                    ),
                    onTap: () {

                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Accept',
                              style: TextStyle(fontSize: 14),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFF4B53F5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                              fixedSize: Size(107, 42)
                            ),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Reject',
                              style: TextStyle(fontSize: 14),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFE02020),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                fixedSize: Size(107, 42)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 10,)
                ],
              ),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
