import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/providers/loginFormProvider.dart';
import 'package:shop_of_vehicles/providers/registerFormProvider.dart';
import 'package:shop_of_vehicles/screens/ui/login/loginScreen.dart';
import 'package:shop_of_vehicles/theme/menuTheme.dart';
import 'package:shop_of_vehicles/theme/themeChange.dart';

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
        ChangeNotifierProvider(create: (_) => ThemeChanger(6)),
        BlocProvider(create: ( _ ) => UserCubit() ),
      ],
      child: Builder(
        builder: (context) {
          final appTheme = Provider.of<ThemeChanger>(context);
          return MaterialApp(            
            debugShowCheckedModeBanner: false,
            title: textTitleWebSite,
            initialRoute: textInitialRouteApp,
            home: LoginScreen(),
            //theme: appTheme.darkTheme ? themeDarkTwo : themeLightTwo, 
            theme: appTheme.darkTheme ? themeDarkOne : themeLightOne, 
          );
        }
      ),      
    );     
  } 
}