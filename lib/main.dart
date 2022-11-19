import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_of_vehicles/providers/loginFormProvider.dart';
import 'package:shop_of_vehicles/screens/ui/login/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginFormProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Login',
          initialRoute: 'login',
          home: LoginScreen(),
          theme:
              ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
        ),      
    );     
  }
}