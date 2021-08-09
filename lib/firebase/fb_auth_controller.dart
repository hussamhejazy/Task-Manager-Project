import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_manager/utils/helpers.dart';

class FbAuthController with Helpers {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Future<bool> signIn(BuildContext context,
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return await _controlEmailValidation(context, credential: userCredential);
    } on FirebaseAuthException catch (e) {
      _controlErrorCodes(context, e);
    } catch (e) {
      print('Exception: $e');
    }
    return false;
  }
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  bool get isLoggedIn => _firebaseAuth.currentUser != null;
  Future<bool> _controlEmailValidation(BuildContext context,
      {required UserCredential credential}) async {
    if (!credential.user!.emailVerified) {
      await credential.user!.sendEmailVerification();
      await _firebaseAuth.signOut();
      showSnackBar(
          context: context,
          content: 'Verification email sent, please check and confirm');
      return false;
    }
    return true;
  }


  void _controlErrorCodes(
      BuildContext context, FirebaseAuthException authException) {
    showSnackBar(
        context: context, content: authException.message ?? '', error: true);
    switch (authException.code) {
      case 'email-already-in-use':
        break;

      case 'invalid-email':
        break;

      case 'operation-not-allowed':
        break;

      case 'weak-password':
        break;

      case 'user-not-found':
        break;

      case 'requires-recent-login':
        break;
    }
  }
}
