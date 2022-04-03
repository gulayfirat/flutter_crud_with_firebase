import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interview_project/feature/users/model/user_model.dart';

class AuthenticationFunction {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final googleSign = GoogleSignIn();
  UserCredential? userCredential;
  UserModel? userModel;
  String? userId;
  Future<User?> signInWithGoogle() async {
    final googleUser = await googleSign.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        userCredential = await _auth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        userId = userCredential!.user!.uid;
        addUser();
        return userCredential!.user;
      }
    } else {
      throw FirebaseAuthException(
          message: "Sign in abored by user", code: "ERROR_ABORDER_BY_USER");
    }
  }

  Future<User?> addUser() async {
    userModel = UserModel(
      email: userCredential!.user!.email,
      username: userCredential!.user!.displayName,
    );
    await _firestore
        .collection("users")
        .doc(userCredential?.user?.uid)
        .set(userModel!.toJson());
  }

  Future<UserModel?> getById() async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection("users").doc(userId).get();
    if (querySnapshot.exists) {
      return UserModel(
        username: querySnapshot["username"],
        email: querySnapshot["email"],
        myData: querySnapshot["myData"],
      );
    }

    return null;
  }
}
