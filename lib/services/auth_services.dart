import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whoop/screens/authentication/sign_in.dart';
import 'package:whoop/screens/list_of_recent_chat.dart/list_of_recent_chat.dart';
import 'package:whoop/services/shared_preferences_services.dart';
import 'package:whoop/services/toast_service.dart';
import 'package:whoop/services/user_services.dart';

class AuthServices {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserServices _userServices = UserServices();

  void tryToSignInWithGoogle(BuildContext context) {
    try {
      signInAndSaveUserData(context);
    } catch (e) {
      ToastService.showToast(context, 'Error: $e');
    }
  }

  void signInAndSaveUserData(BuildContext context) {
    signInWithCredential().then(
      (user) {
        _userServices.addNewUser(user.uid, user.displayName, user.email, user.photoUrl);
        saveCurrentUserToSP(user);
        ToastService.showToast(context, 'Welcome ${user.displayName}');
      },
    ).whenComplete(() {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => ListOfRecentChat()),
      );
    });
  }

  Future<FirebaseUser> signInWithCredential() async {
    final GoogleSignInAccount signInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication authentication = await signInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );
    final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
    final FirebaseUser firebaseUser = authResult.user;
    assert(!firebaseUser.isAnonymous);
    assert(await firebaseUser.getIdToken() != null);
    return firebaseUser;
  }

  Future saveCurrentUserToSP(FirebaseUser firebaseUser) async {
    final FirebaseUser currentUser = await _firebaseAuth.currentUser();
    assert(firebaseUser.uid == currentUser.uid);
    await saveStringToSharedPreferences('id', currentUser.uid);
    await saveStringToSharedPreferences('name', currentUser.displayName);
  }

  //TODO
  Future signUp(BuildContext context) async {}

  Future signOut(BuildContext context) async {
    await _googleSignIn.signOut().whenComplete(() async {
      await removeFromSharedPreferences('id');
      await removeFromSharedPreferences('name');
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => SignIn()),
      );
      ToastService.showToast(context, 'Sign Out');
    });
  }
}
