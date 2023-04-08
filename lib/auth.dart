import 'package:firebase_auth/firebase_auth.dart';

//register a new user
// Future<String?> mailRegister(String mail, String pwd) async {
//   try {
//   await FirebaseAuth.instance
//       .createUserWithEmailAndPassword(email: mail, password: pwd);
//     return null;
//   } on FirebaseAuthException catch (ex) {
//     return "${ex.code}: ${ex.message}";
//   }
// }
//
// Future<String?> signOut() async {
//   try {
//   await FirebaseAuth.instance.signOut();
//     return null;
//   } on FirebaseAuthException catch (ex) {
//     return "${ex.code}: ${ex.message}";
//   }
// }

class Auth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
