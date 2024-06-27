import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_exception.dart';

class AuthServices {
  // signup with email and password
  late AuthResultStatus status;
  Future<AuthResultStatus> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user != null) {
        status = AuthResultStatus.successful;
      } else {
        status = AuthResultStatus.undefined;
      }
    } catch (e) {
      status = AuthExceptionHandler.handleException(e);
    }
    return status;
  }

  // signup with email and password

  Future<AuthResultStatus> signupWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
          if(authResult.user != null){
          await saveUserDetails(name: name, email: email, password: password,userId: authResult.user!.uid);
            status = AuthResultStatus.successful;
          }else{
            status = AuthResultStatus.undefined;
          }
    } catch (msg) {
      status = AuthExceptionHandler.handleException(msg);
    }
    return status;
  }

  Future<void> saveUserDetails({
    required String name,
    required String email,
    required String password,
    userId
  })async{
    try{
   await FirebaseFirestore.instance.collection('demousers').add({
      'name':name,
      'email':email,
      'password':password,
      'userId':userId
    });
    print("success added user info");
    }catch(e){
      print("Erorr in adding user info$e");
    }
  }

 // Sign out
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
    rethrow;
 
    }
  }

// Getter to listen to auth state changes
   Stream<User?> get user {
    return FirebaseAuth.instance.authStateChanges();
  }

}
