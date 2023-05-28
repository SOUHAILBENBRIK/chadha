import 'package:flutter/material.dart';
import 'package:match_remainder/controller/auth.dart';

import 'package:match_remainder/utils/consts.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../utils/fonctions.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool leading = false;
  bool state = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Visibility(
          visible: !leading,
          replacement: Center(child: CircularProgressIndicator()),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        Image.asset("assets/images/Campo de futebol.jpg").image,
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5, top: 5),
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 35,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: height * 0.51,
                    decoration: BoxDecoration(
                        color: Constants.whiteColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    padding: EdgeInsets.symmetric(vertical: height * 0.05),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Bienvenue à\nStadeMinder ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(
                            child: Column(
                              children: [
                                StandartFunction.inputAuthontification(
                                    controller: email,
                                    name: "email",
                                    path: "assets/images/equipeProfile.png",
                                    width: width),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                StandartFunction.inputAuthontification(
                                    controller: password,
                                    name: "password",
                                    path: "assets/images/lock.png",
                                    width: width),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    debugPrint(email.text);
                                    if (email.text.isEmpty ||
                                        password.text.isEmpty) {
                                      StandartFunction.errorMessege(context,
                                          "email or password fild are empty");
                                    } else {
                                      setState(() {
                                        leading = true;
                                      });

                                      for (User i in Constants.users) {
                                        if (i.email != email.text ||
                                            i.password != password.text) {
                                          continue;
                                        } else if (i.email == email.text &&
                                            i.password == password.text) {
                                          state = true;
                                          Provider.of<AuthController>(context,
                                                  listen: false)
                                              .setUser(i);

                                          // ignore: use_build_context_synchronously
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage()));
                                          break;
                                        }
                                      }
                                      if (!state) {
                                        StandartFunction.errorMessege(context,
                                            "username or password are wrong");
                                      }

                                      setState(() {
                                        leading = false;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: height / 15,
                                    width: width - 60,
                                    decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    child: const Center(
                                      child: Text(
                                        "Connexion",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 3),
                    child: const Text(
                      "Reset password",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
