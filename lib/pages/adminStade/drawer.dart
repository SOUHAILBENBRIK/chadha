import 'package:flutter/material.dart';

import 'package:match_remainder/pages/adminStade/allReservationPage.dart';
import 'package:match_remainder/pages/homePage.dart';
import 'package:match_remainder/pages/login.dart';
import 'package:provider/provider.dart';

import '../../controller/auth.dart';
import '../Maintenance/statistique.dart';
import '../profilePage.dart';
import 'DemandeEquipe.dart';
import 'allUserPage.dart';
import 'demandeMentenance.dart';

class DrawerAdminPage extends StatefulWidget {
  const DrawerAdminPage({super.key});

  @override
  State<DrawerAdminPage> createState() => _DrawerAdminPageState();
}

class _DrawerAdminPageState extends State<DrawerAdminPage> {
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
              widget: ProfilePage(
                user: Provider.of<AuthController>(context, listen: true).user,
              )),
          element(
            context,
            icon: Icons.send,
            text: "les demandes de \n maintenance",
            widget: const DemandeMantenance(),
          ),
          element(
            context,
            icon: Icons.send,
            text: "les demandes de  \n reservations",
            widget: const DemandeEquipe(),
          ),
          /*element(
            context,
            icon: Icons.list,
            text: "les societés de \n maintenance ",
            widget: const MaintenanceStaffPage(),
          ),*/
          /*element(
            context,
            icon: Icons.list,
            text: "les équipes",
            widget: const EquipeStaffPage(),
          ),*/
          element(
            context,
            icon: Icons.list,
            text: "les utilisateurs",
            widget: const AllUserPage(),
          ),
          element(
            context,
            icon: Icons.insights_outlined,
            text: "les statistiques",
            widget: const Stats(
              index: 0,
            ),
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
