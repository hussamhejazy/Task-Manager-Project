
import 'package:flutter/material.dart';
import 'package:task_manager/models/bn_screen.dart';
import 'nb_screens/home_screen.dart';
import 'nb_screens/pk_notifications_screen/notifications_screen.dart';
import 'nb_screens/pk_task_screen/task_screen.dart';
import 'nb_screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;
   final List<BnScreen> _bnScreen = <BnScreen>[
     BnScreen(widget: HomeScreen()),
     BnScreen(widget: TaskScreen()),
     BnScreen(widget: NotificationsScreen()),
     BnScreen(widget: SettingScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset('images/Logo.png',height: 26,),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFF5F5F5),
        unselectedItemColor: Color(0xFFCCCCCC),
        selectedIconTheme: IconThemeData(color: Color(0xFF4B53F5)),
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (int selectedItemIndex){
          setState((){
            _currentIndex = selectedItemIndex;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)
              ,label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined),
              label:'Task',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none),
              label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings),
              label: 'Settings',
          ),
        ],
      ),
      body: _bnScreen[_currentIndex].widget,
    );
  }
}


