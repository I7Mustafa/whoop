import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whoop/screens/authentication/sign_in.dart';
import 'package:whoop/screens/list_of_recent_chat.dart/list_of_recent_chat.dart';
import 'package:whoop/services/shared_preferences_services.dart';
import 'package:whoop/services/user_services.dart';
import 'package:whoop/widgets/snak_bar.dart';

class AuthServices {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserServices _userServices = UserServices();

  FToast _fToast;

  Future signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount signInAccount = await _googleSignIn
        .signIn()
        .catchError((errorMg) => Scaffold.of(context).showSnackBar(snackBar(errorMg)));

    final GoogleSignInAuthentication authentication = await signInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );

    final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
    final FirebaseUser firebaseUser = authResult.user;

    _userServices.addNewUser(
      firebaseUser.uid,
      firebaseUser.displayName,
      firebaseUser.email,
      firebaseUser.photoUrl,
    );

    assert(!firebaseUser.isAnonymous);
    assert(await firebaseUser.getIdToken() != null);

    final FirebaseUser currentUser = await _firebaseAuth.currentUser();
    assert(firebaseUser.uid == currentUser.uid);

    await saveStringToSharedPreferences('id', currentUser.uid);
    await saveStringToSharedPreferences('name', currentUser.displayName);

    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => ListOfRecentChat()),
    );

    return currentUser;
  }

  Future signUp(BuildContext context) async {}

  Future signOut(BuildContext context, String message) async {
    await _googleSignIn.signOut().whenComplete(() async {
      await removeFromSharedPreferences('id');
      await removeFromSharedPreferences('name');

      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => SignIn()),
      );
    });
  }
}
