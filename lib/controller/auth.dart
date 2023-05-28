import 'package:flutter/material.dart';

import '../model/user.dart';

class AuthController with ChangeNotifier {
  late User user;
  void setUser(User val) {
    user = val;
    NotificationListener;
  }
}
