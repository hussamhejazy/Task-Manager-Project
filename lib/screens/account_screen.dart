import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_auth_controller.dart';
import 'package:task_manager/utils/helpers.dart';
import 'package:task_manager/widgets/app_text_field.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> with Helpers {
  late User _user;
  late TextEditingController _emailTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user = FbAuthController().user;
    _emailTextController = TextEditingController(text: _user.email ?? '');
    _nameTextController = TextEditingController(text: _user.displayName ?? '');
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _nameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          ' ACCOUNT',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: Colors.black.withOpacity(0.61),
                  blurRadius: 6,
                )
              ]),
              child: CircleAvatar(radius: 50),
            ),
            SizedBox(height: 10),
            Text(
              _user.displayName ?? 'NO NAME',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              _user.email ?? 'NO EMAIL',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 14,
              ),
            ),
            Divider(
              height: 40,
              thickness: 1,
            ),
            AppTextField(
              hint: 'Email',
              controller: _emailTextController,
              keyboardType: TextInputType.emailAddress,
              maxLength: 35,
            ),
            SizedBox(height: 10),
            AppTextField(
              hint: 'Name',
              controller: _nameTextController,
              maxLength: 30,
            ),
            SizedBox(height: 10),
            AppTextField(
              hint: 'Password',
              controller: _passwordTextController,
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await performUpdateProfile();
              },
              child: Text('SAVE'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> performUpdateProfile() async {
    if (checkData()) {
      updateProfile();
    }
  }

  bool checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context: context, content: 'Enter required data');
    return false;
  }

  Future<void> updateProfile() async {
    bool updated = await FbAuthController().updateProfile(context,
        email: _emailTextController.text.trim(),
        name: _nameTextController.text.trimRight().trimLeft(),
        password: _passwordTextController.text);
    if (updated) {
      setState(() {
        _user = FbAuthController().user;
      });
    }
    String message = updated ? 'Profile updated successfully': 'Update profile failed, try again';
    showSnackBar(
        context: context,
        content: message,
        error: !updated);
  }
}
