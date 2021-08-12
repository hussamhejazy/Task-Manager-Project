import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_manager/utils/helpers.dart';

class FbAuthController with Helpers {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> createAccount(BuildContext context,
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _controlEmailValidation(context, credential: userCredential);
      return true;
    } on FirebaseAuthException catch (e) {
      _controlErrorCodes(context, e);
    } catch (e) {
      print('Exception: $e');
    }
    return false;
  }

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

  Future<bool> forgetPassword(BuildContext context,
      {required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      _controlErrorCodes(context, e);
    } catch (e) {
      print(e);
    }
    return false;
  }


  User get user => _firebaseAuth.currentUser!;

  Future<bool> updateProfile(BuildContext context,
      {required String email, required String name, String? password}) async {
    try {
      await updateEmail(context, email: email);
      await updateDisplayName(name: name);
      await updatePassword(context);
      return true;
    } on FirebaseAuthException catch (e) {
      _controlErrorCodes(context, e);
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<void> updatePassword(BuildContext context, {String? password}) async {
    if(password != null && password.isNotEmpty) {
      await _firebaseAuth.currentUser!.updatePassword(password);
    }
  }

  Future<void> updateDisplayName({required String name}) async {
    if (name != user.displayName) {
      await _firebaseAuth.currentUser!
          .updateDisplayName(name)
          .then((value) => true)
          .catchError((error) => false);
    }
  }

  Future<void> updateEmail(BuildContext context,
      {required String email}) async {
    if (email != user.email) {
      await _firebaseAuth.currentUser!.verifyBeforeUpdateEmail(email);
    }
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
