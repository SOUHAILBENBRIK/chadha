import 'package:flutter/material.dart';
import 'package:match_remainder/controller/auth.dart';
import 'package:match_remainder/pages/adminEquipe/mesReservations.dart';
import 'package:match_remainder/pages/adminEquipe/reserveStade.dart';
import 'package:match_remainder/pages/homePage.dart';
import 'package:match_remainder/pages/profilePage.dart';
import 'package:provider/provider.dart';

import '../Maintenance/equipe.dart';
import '../login.dart';

class DrawerEquipePage extends StatefulWidget {
  const DrawerEquipePage({super.key});

  @override
  State<DrawerEquipePage> createState() => _DrawerEquipePageState();
}

class _DrawerEquipePageState extends State<DrawerEquipePage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: const EdgeInsets.only(top: 40, left: 10),
        child: Column(children: [
          element(context,
              icon: Icons.home, text: "home", widget: const HomePage()),
          element(context,
              icon: Icons.person,
              text: "Profile",
              widget: ProfilePage(user: Provider.of<AuthController>(context,listen: true).user,)),
          element(
            context,
            icon: Icons.send,
            text: "Envoyer reservation",
            widget: const ReserveStadePage(),
          ),
          element(
            context,
            icon: Icons.list,
            text: "mes réservation ",
            widget: const MesReservationsPage(),
          ),
          element(context,
              icon: Icons.logout, text: "Log out", widget: const LoginPage()),
        ]),
      ),
    );
  }
}

Widget element(BuildContext context,
    {required IconData icon, required String text, required Widget widget}) {
  return GestureDetector(
    onTap: () {
      if (text != "Profile")
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return widget;
        }));
    },
    child: Container(
      //margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.green,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    ),
  );
}
