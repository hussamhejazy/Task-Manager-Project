
import 'package:flutter/material.dart';
import 'package:task_manager/firebase/fb_auth_controller.dart';
import 'package:task_manager/utils/helpers.dart';
import 'package:task_manager/widgets/app_text_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    with Helpers {
  late TextEditingController _NameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _NameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _NameTextController.dispose();
    _emailTextController.dispose();
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
          'CREATE ACCOUNT',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create new account...',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            Text(
              'Enter email and password...',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
            AppTextField(
              hint: 'Name',
              controller: _NameTextController,
              maxLength: 30,
            ),
            SizedBox(height: 10),
            AppTextField(
              hint: 'Email',
              controller: _emailTextController,
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
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                await performCreateAccount();
              },
              child: Text('CREATE ACCOUNT'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> performCreateAccount() async {
    if (checkData()) {
      await createAccount();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context: context, content: 'Enter email & password');
    return false;
  }

  Future<void> createAccount() async {
    bool status = await FbAuthController().createAccount(context,
        email: _emailTextController.text,
        password: _passwordTextController.text);
    if (status) Navigator.pop(context);
  }
}
