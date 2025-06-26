import 'package:flutter/foundation.dart';
import '../../../core/utils/shared_prefs.dart';

class AuthViewModel extends ChangeNotifier {
  final SharedPrefs _sharedPrefs = SharedPrefs();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _sharedPrefs.isLoggedIn();

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulating API call
    await Future.delayed(const Duration(seconds: 2));

    // For demo purposes, any valid email/password combination is accepted
    await _sharedPrefs.setLoggedIn(true);
    await _sharedPrefs.setUserEmail(email);

    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    await _sharedPrefs.clear();
    notifyListeners();
  }
}
