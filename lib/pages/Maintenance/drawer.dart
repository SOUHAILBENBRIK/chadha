import 'package:flutter/material.dart';
import 'package:match_remainder/pages/Maintenance/reservation.dart';
import 'package:match_remainder/pages/Maintenance/statistique.dart';

import 'package:match_remainder/pages/homePage.dart';
import 'package:provider/provider.dart';

import '../../controller/auth.dart';
import '../login.dart';
import '../profilePage.dart';
import 'mesMaintenance.dart';

class DrawerManPage extends StatefulWidget {
  const DrawerManPage({super.key});

  @override
  State<DrawerManPage> createState() => _DrawerManPageState();
}

class _DrawerManPageState extends State<DrawerManPage> {
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
            text: "Envoyer une maintenance",
            widget: const ReservationMaintenance(),
          ),
          element(
            context,
            icon: Icons.list,
            text: "mes  maitenance ",
            widget: const MesMaintenancePage(),
          ),
          element(
            context,
            icon: Icons.list,
            text: "les statistiques",
            widget: const Stats(index: 1,),
          ),
          element(
            context,
            icon: Icons.logout,
            text: "Log out",
            widget: const LoginPage()
          ),
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
