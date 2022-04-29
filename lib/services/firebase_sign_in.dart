import 'package:firebase_auth_dart/firebase_auth_dart.dart';
import 'package:mlp_sys/services/data_cacher.dart';

class FirebaseAuthService {
  FirebaseAuthService._singleton();
  static final FirebaseAuthService _instance = FirebaseAuthService._singleton();
  static FirebaseAuthService get instance => _instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DataCacher _cacher = DataCacher.instance;
  Future<User?> signin({
    required String email,
    required String password,
    bool isRemember = true,
  }) async {
    try {
      UserCredential _cred =
          await _auth.signInWithEmailAndPassword(email, password);
      User? _user = _cred.user;
      if (_user != null) {
        if (isRemember) {
          _cacher.setUser(email: email, password: password);
        }
      }
      return _user;
    } on FirebaseAuthException catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> register({
    required String email,
    required String password,
    bool isRemember = true,
  }) async {
    try {
      UserCredential _cred =
          await _auth.createUserWithEmailAndPassword(email, password);
      User? _user = _cred.user;
      if (_user != null) {
        if (isRemember) {
          _cacher.setUser(email: email, password: password);
        }
      }
      return _user;
    } on FirebaseAuthException catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e);
      return;
    }
  }
}
