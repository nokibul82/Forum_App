import 'package:flutter/material.dart';
import 'package:forumapp/view/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forum App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey,onPrimary: Colors.black,secondary: Colors.white,),
        useMaterial3: true,
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: size * 0.04, fontFamily: 'Montserrat-Regular'),
          bodyMedium: TextStyle(fontSize: size * 0.05, fontFamily: 'Montserrat-Medium'),
          displayLarge: TextStyle(fontSize: size * 0.07, fontFamily: 'Montserrat-Bold')
        )
      ),
      home: LoginScreen(),
    );
  }
}

