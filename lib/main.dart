import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/providers/loginFormProvider.dart';
import 'package:shop_of_vehicles/providers/registerFormProvider.dart';
import 'package:shop_of_vehicles/screens/ui/login/loginScreen.dart';
import 'package:shop_of_vehicles/theme/theme.dart';

void main() {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
        ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
        ChangeNotifierProvider(create: (_) => new ThemeChanger( 2 )),
        BlocProvider(create: ( _ ) => new UserCubit() ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop of Vehicles',
          initialRoute: 'login',
          home: LoginScreen(),
          theme:
              ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
        ),      
    );     
  } 
}