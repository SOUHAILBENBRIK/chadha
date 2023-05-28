import 'package:flutter/material.dart';

import '../model/stades.dart';
import '../model/user.dart';

class Constants {
  static Color whiteColor = Colors.white.withOpacity(0.5);
  static String stade1 = "assets/images/sousse.jpg";
  static String stade2 = "assets/images/rades.jpg";
  static List<Stade> stades = [
    Stade(name: "Stade Olympique de Rades ", image: stade1, percent: 50),
    Stade(name: "Stade Olympique de Sousse ", image: stade2, percent: 20),
    Stade(name: "Stade Olympique de sfax ", image: stade1, percent: 80),
  ];
  static List<User> users = [
    User(
        name: "hamza",
        email: "hamza@gmail.com",
        role: Roles.admin,
        password: "123"),
    User(
        name: "sirine",
        email: "sirine@gmail.com",
        role: Roles.chefMaintenance,
        password: "123"),
    User(
        name: "narjes",
        email: "narjes@gmail.com",
        role: Roles.chefEquipe,
        password: "123"),
  ];
}
