import 'package:flutter/material.dart';
import 'package:task_manager/models/bn_screen.dart';
import 'package:task_manager/screens/bn_screen/notifications_screen.dart';
import 'package:task_manager/screens/bn_screen/settings_screen.dart';

import 'bn_screen/home_screen.dart';
import 'bn_screen/task_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex=0;
  List<BnScreen> _bnscreen=<BnScreen>[
    BnScreen(title: 'Home', widget: HomeScreen()),
    BnScreen(title: 'Task', widget: TaskScreen()),
    BnScreen(title: 'Notification', widget: NotificationsScreen()),
    BnScreen(title: 'Settings', widget: SettingScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(_bnscreen[_currentIndex].title,style: TextStyle(
        fontWeight:FontWeight.bold,
        color: Colors.black
      ),
      ),
        centerTitle: true,
        leading: SizedBox(),
        elevation:0,
        backgroundColor: Colors.white,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int selectedItemIndex){
              setState(() {
                _currentIndex=selectedItemIndex;
              });
            },
            currentIndex: _currentIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(fontWeight:FontWeight.bold),
            selectedItemColor: Color(0xFF4B53F5),
            unselectedIconTheme: IconThemeData(color: Colors.grey.shade300),
            unselectedItemColor: Color(0xFFCCCCCC),
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label:'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.note_outlined), label:'Task'),
              BottomNavigationBarItem(icon: Icon(Icons.notifications_active), label:'Notifications'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label:'Settings'),


            ],
          ),
    body: _bnscreen[_currentIndex].widget,
    );
  }
}
