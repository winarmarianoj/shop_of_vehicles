import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/screens/profile/profileUser.dart';
import 'package:shop_of_vehicles/screens/ui/login/loginScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/User.dart';


class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key? key, }) : super(key: key);  

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<UserCubit, UserState>(
      builder: ( _ , state) {

        switch ( state.runtimeType ) {
          
          case UserInitial:
            return Center(child: Text('No hay información del usuario'));

          case UserActive:
            return BodyDrawer(user: (state as UserActive).user, );

          default:
            return Center( child: Text('Estado no reconocido '));
        }
    });
  }  
}

class BodyDrawer extends StatelessWidget{
  final User user;
  final transitionDuration = Duration(milliseconds: 250);

  BodyDrawer({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      //backgroundColor: themeDrawerBackground,
      width: 280,
        child: Column(
      children: [
        DrawerHeader(
          duration: transitionDuration,
          decoration: colorsShopOfVehicles(),
          child: Column(
            children: [              
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Bienvenido: "),   
                    TextSpan(
                      text: user.name + " " + user.lastName,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: themeDrawerText, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),    
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Web Site: "),   
                    TextSpan(
                      text: "Autos/Camionetas/Camiones",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: themeDrawerText, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),    
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Contacto: "),   
                    TextSpan(
                      text: "119876543 - 1123459877",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: themeDrawerText, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),    
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Email: "),   
                    TextSpan(
                      text: "shopofvehicles@algunlugar.com.ar",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: themeDrawerText, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),    
              const SizedBox(height: 10),
            ],
          ),
        ), 
        ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileUser(),
                ),
              );
            }
        ),
        ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Logout'),
            onTap: () {
              context.read<UserCubit>().logout();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            }
        ),
      ],
    ));
  }
  
  BoxDecoration colorsShopOfVehicles() => BoxDecoration(
          gradient: LinearGradient(colors: [
        themeDrawerBackground, 
        themeDrawerBackground, 
      ])
  );


}