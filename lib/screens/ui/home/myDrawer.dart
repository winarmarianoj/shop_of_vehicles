import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/screens/ui/home/optionRoutes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_of_vehicles/screens/ui/login/loginScreen.dart';
import 'package:shop_of_vehicles/theme/themeChange.dart';
import 'package:shop_of_vehicles/widgets/text/myText.dart';
import '../../../models/User.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key? key, }) : super(key: key);  

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<UserCubit, UserState>(
      builder: ( _ , state) {

        switch ( state.runtimeType ) {
          
          case UserInitial:
            return Center(child: Text(textNoDataUserInitial));

          case UserActive:
            return BodyDrawer(user: (state as UserActive).user, );

          default:
            return Center( child: Text(textUnknownState));
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
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;
    return Drawer(
      width: 280,
        child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.fromLTRB(20.0, 25.0, 15.0, 15.0),
            duration: transitionDuration,
            child: Column(
              children: [ 
                MyBodyMediumText(
                  text: textWelcome + " " + user.name + " " + user.lastName,
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 5),
                MyBodyMediumText(
                  text: textWebSite + " " + textWebSiteName,
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ), 
                const SizedBox(height: 5),
                MyBodyMediumText(
                  text: textTypeVehiclesWebSite,
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ), 
                const SizedBox(height: 5),
                MyBodyMediumText(
                  text: textContactTitle + " " + textContactPhone,
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),   
                const SizedBox(height: 5),
                MyBodyMediumText(
                  text: textContactEmail,
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
            child: SafeArea(            
              child: SizedBox(             
                width: double.infinity,
                height: 100,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text(textInitialsWebSiteName, style: TextStyle( fontSize: 50, color: Colors.black),),
                ),
              ),
            ),
          ),
          Expanded(
            child: OptionRoutes()
          ),
          ListTile(
            leading: Icon( Icons.lightbulb_outline, color: accentColor ),
            title: Text(textDarkModeTheme),
            trailing: 
            Switch.adaptive(
              value: appTheme.darkTheme,
              activeColor: accentColor,
              onChanged: ( value ) => appTheme.darkTheme = value
            ),
          ),
          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading: Icon( Icons.add_to_home_screen, color: accentColor ),
              title: Text(textCustomModeTheme),
              trailing: Switch.adaptive(
                value: appTheme.customTheme, 
                activeColor: accentColor,
                onChanged: ( value ) => appTheme.customTheme = value
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: accentColor ),
            title: Text(textLogout),
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
      )
    );
  }
  
  BoxDecoration colorsShopOfVehicles() => BoxDecoration(
          gradient: LinearGradient(colors: [
        themeDrawerBackground, 
        themeDrawerBackground, 
      ])
  );

}