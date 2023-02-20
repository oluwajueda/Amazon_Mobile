import 'package:amazon_mobile/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      email: "",
      id: "",
      name: "",
      password: "",
      address: "",
      type: "",
      token: "");

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
