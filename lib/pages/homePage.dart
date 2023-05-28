import 'package:flutter/material.dart';
import 'package:match_remainder/controller/auth.dart';
import 'package:match_remainder/utils/consts.dart';
import 'package:provider/provider.dart';

import 'reservationsPages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        hintText: "Rechercher ...",
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: height * 0.09,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: 15),
                  height: height * 0.45,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReservationsPage(
                                          role: Provider.of<AuthController>(
                                                  context)
                                              .user
                                              .role,
                                          index: index,
                                          name: Constants.stades[index].name,
                                        )));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Image.asset(
                                  Constants.stades[index].image,
                                  height: height * 0.3,
                                  width: width * 0.8,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  Constants.stades[index].name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: "Oswald"),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
