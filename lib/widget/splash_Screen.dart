import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:match_remainder/pages/login.dart';

class Spalshscreen extends StatefulWidget {
  const Spalshscreen({super.key});

  @override
  State<Spalshscreen> createState() => _SpalshscreenState();
}

class _SpalshscreenState extends State<Spalshscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(157, 7, 255, 19),
      body: Container(
        width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(image: Image.asset("assets/images/splashScreen.jpg").image,fit: BoxFit.cover)
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: size.height*0.3,
              width: size.width,
              child: LottieBuilder.asset(
                  "assets/animation/63704-soccer-ball.json"),
            ),
            const SizedBox(),
            const Center(
              child: Text(
                "StadeMinder",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "DynaPuff",
                    color: Color.fromARGB(255, 250, 250, 250),
                    fontSize: 32),
              ),
            )
          ],
        ),
      ),
    );
  }
}
