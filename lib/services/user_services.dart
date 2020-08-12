import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whoop/models/user.dart';

class UserServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userCollectionReference = Firestore.instance.collection('Users');

  Future addNewUser(String id, String name, String email, String userImg) async {
    return await _userCollectionReference.document(id).setData({
      'id': id,
      'name': name,
      'email': email,
      'userImg': userImg,
    });
  }

  User getUserData(DocumentSnapshot document) {
    return User(
      userId: document.data['id'] ?? '',
      email: document.data['email'] ?? '',
      name: document.data['name'] ?? '',
      userImg: document.data['userImg'] ?? null,
    );
  }
}
