import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/screens/home/home.dart';
import 'package:shop_of_vehicles/screens/ui/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*debugShowCheckedModeBanner: false,
      title: 'Shop Of Vehicles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),*/

      debugShowCheckedModeBanner: false,
      title: 'Login',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => const Home(),
      },
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),

    );
  }
}