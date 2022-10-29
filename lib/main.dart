import 'package:dreamgirls/UI/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() => runApp(GetMaterialApp(
      home: const MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        // change the focus border color of the TextField
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.black),
        // change the focus border color when the errorText is set
        errorColor: Colors.purple,
      ),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const HomePage(),
      duration: 2000,
      imageSize: 100,
      imageSrc: "assets/logo.png",
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
    );
  }
}
