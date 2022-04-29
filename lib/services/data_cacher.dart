import 'package:firebase_auth_dart/firebase_auth_dart.dart';
import 'package:mlp_sys/services/firebase_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataCacher {
  DataCacher._singleton();
  late final SharedPreferences _preferences;
  static final _instance = DataCacher._singleton();
  static DataCacher get instance => _instance;
  final FirebaseAuthService _authService = FirebaseAuthService.instance;
  void init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<User?> get currentUser async {
    String? email = _preferences.getString("email");
    String? password = _preferences.getString("password");
    if (email == null || password == null) return null;
    return await _authService.signin(email: email, password: password);
  }

  void setUser({required String email, required String password}) {
    _preferences.setString('email', email);
    _preferences.setString('password', password);
  }
}
