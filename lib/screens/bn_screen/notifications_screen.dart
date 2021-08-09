import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// class NotificationsScreen extends StatelessWidget {
//   const NotificationsScreen({Key? key}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: ListView.builder(itemBuilder: (context,index){
//           return ListTile(
//             title: Text('Dendi has add a new task for you',style:TextStyle(
//                 fontSize: 16,
//                 color: Colors.black.withOpacity(0.7)
//             )
//             ),
//             subtitle: Text('Dendi has add a new task for you',style:TextStyle(
//                 fontSize: 16,
//                 color: Colors.black.withOpacity(0.4)
//             )),
//             trailing:  Text('2h',style: TextStyle(
//                 fontSize: 10
//             ),),
//             onTap: (){
//               print(index);
//             },
//
//           );
//         },itemCount: 10,reverse: true,)
//       ),
//     );
//   }
// }


import 'package:task_manager/models/Task.dart';
import 'package:task_manager/screens/nb_screens/pk_notifications_screen/request_ntifications_list.dart';

class NotificationsScreen extends StatefulWidget {

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: Color(0xFF4B53F5),
                    width: 1
                )
            ),
            indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
            tabs: [
              Tab(text: 'Requests'),
              Tab(text: 'Holidays'),
              Tab(text: 'Others')
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            RequestsNotification(status: 0),
            RequestsNotification(status: 1),
            RequestsNotification(status: 2),
          ],
        )
    );
  }
}



