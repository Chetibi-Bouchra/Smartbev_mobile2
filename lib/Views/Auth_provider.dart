import 'package:flutter/material.dart';
import 'package:smartbevmobile2/Models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoggedIn = false;
  late User user;

  void login(User utilisateur) {
    // Perform login logic
    user = utilisateur;
    isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    // Perform logout logic
    isLoggedIn = false;
    notifyListeners();
  }
}
