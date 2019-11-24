import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String authToken = "f";

  void setAuthToken(String token) {
    this.authToken = token;
    notifyListeners();
  }
}
