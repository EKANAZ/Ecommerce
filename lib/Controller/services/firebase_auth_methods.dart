
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'database_service.dart';

class FirebaseAuthMethods {
  final _auth = FirebaseAuth.instance;

  final _googlesignIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  
//login
  Future loginUserwithEmailandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register

  Future regisdterUserwithEmailandPassword(
      String fullname,
      String email,
      String password,
      String lastname,
      String phonenumber,
      String place) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      DatabaseService(Uid: user.uid)
          .saveUserData(fullname, lastname, email, phonenumber, place);
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // signout

  signOut() async {

    await _auth.signOut();
    await _googlesignIn.signOut();
  }
}
