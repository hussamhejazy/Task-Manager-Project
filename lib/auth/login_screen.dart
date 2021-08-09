import 'package:flutter/material.dart';
import 'package:task_manager/models/user.dart';
import 'package:task_manager/preferences/app_preferences.dart';
import 'package:task_manager/utils/helpers.dart';
import 'package:task_manager/firebase/fb_auth_controller.dart';
import 'package:task_manager/widgets/app_text_field.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  with Helpers{
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late final TextEditingController controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                hint: 'Email',
                controller: _emailTextController,
                maxLength: 30,
              ),

              SizedBox(height: 15),
              AppTextField(
                hint: 'Password',
                controller: _passwordTextController,
                obscureText: true,
              ),

              SizedBox(height: 25),
              ElevatedButton(
                onPressed: ()async {
                    await performSignIn();
                 // Navigator.pushReplacementNamed(context, '/hi_screen');
                     },
                child: Text('login'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/create_account_screen'),
                child: Text('CREATE ACCOUNT'),
              ),
            ],
          ),
        )
    );
  }
  Future<void> performSignIn() async {
    if (checkData()) {
      await signIn();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context: context, content: 'Enter required data!');
    return false;
  }

  Future<void> signIn() async {
    await AppPreferences().save(user: user);
    bool status = await FbAuthController().signIn(context,
        email: _emailTextController.text,
        password: _passwordTextController.text);
    if (status) {
      Future.delayed(Duration(seconds: 2),(){
        Navigator.pushReplacementNamed(context, '/main_screen');
      });
    }
  }
  User get user {
    return User(
      email: _emailTextController.text,
      name: 'User Name',
    );
  }
}
