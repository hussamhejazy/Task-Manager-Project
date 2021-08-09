import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/models/user.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();
  late SharedPreferences _sharedPreferences;

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setString('email', user.email);
    await _sharedPreferences.setString('name', user.name);
  }

  User get user {
    return User(
      name: _sharedPreferences.getString('name') ?? '',
      email: _sharedPreferences.getString('email') ?? '',
    );
  }

  bool get loggedIn => _sharedPreferences.getBool('logged_in') ?? false;
  Future<bool> logout() async {
    // return await _sharedPreferences.remove('key');
    return await _sharedPreferences.clear();
  }
}
