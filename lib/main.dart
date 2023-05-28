import 'package:flutter/material.dart';
import 'package:match_remainder/controller/auth.dart';
import 'package:match_remainder/pages/profilePage.dart';

import 'package:match_remainder/utils/theme.dart';
import 'package:match_remainder/widget/splash_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
  MultiProvider(
    providers:[
      ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
    ],
    child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StadeMinder',
        debugShowCheckedModeBanner: false,
        theme: myTheme(),
        home:  Spalshscreen());
  }
}
