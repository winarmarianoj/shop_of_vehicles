import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/models/User.dart';
import 'package:shop_of_vehicles/screens/profile/changeProfileUser.dart';
import 'package:shop_of_vehicles/screens/truck/homeTruck.dart';
import 'package:shop_of_vehicles/theme/themeChange.dart';
import 'package:shop_of_vehicles/widgets/text/myText.dart';

class ProfileUser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(textTitleProfile),
        actions: [          
          IconButton(
            icon: const Icon(Icons.local_shipping),
            tooltip: textToolTipTruck,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeTruck(),
                ),
              );
            }, 
          ),
          IconButton(
            icon: const Icon( Icons.logout),
            tooltip: textToolTipLogout,
            onPressed: () {
              context.read<UserCubit>().logout();
            },            
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: BodyScaffold(),
        ),  
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.accessibility_new ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => ChangeProfileUser())))
      ),
   );
  }
}

class BodyScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: ( _ , state) {
        switch ( state.runtimeType ) {          
          case UserInitial:
            return Center(child: Text(textNoDataUserInitial));
          case UserActive:
            return InformacionUsuario( (state as UserActive).user );
          default:
            return Center( child: Text(textUnknownState));
        }
    });
  }
}

class InformacionUsuario extends StatelessWidget {

  final User user;

  const InformacionUsuario( this.user );
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    var colorText = !appTheme.darkTheme ? themeButtonIconsDarkMode : themeButtonIconsCustomMode;

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyProfileText(text: 'Datos de su Perfil', color: colorText,),
              Divider(),

              ListTile( title: MyProfileText(text: 'Nombre: ${ user.name }', color: colorText,) ),
              ListTile( title: MyProfileText(text: 'Apellido: ${ user.lastName }', color: colorText,) ),
              ListTile( title: MyProfileText(text: 'Teléfono: ${ user.phone }', color: colorText,) ),
              ListTile( title: MyProfileText(text: 'Email: ${ user.email }', color: colorText,) ),
              ListTile( title: MyProfileText(text: 'Contraseña: ${ user.password }', color: colorText,) ),
              ListTile( title: MyProfileText(text: 'Dirección: ${ user.street }', color: colorText,) ),

              MyProfileText(text: 'Contactos', color: colorText,),
              Divider(),
              ...user.contacts.map(
                (contact) => ListTile( title: MyProfileText(text: contact.name + " " + contact.lastname, color: colorText, ),
                                      subtitle: MyProfileText(text:contact.phone + " " + contact.email, color: colorText,),)
              ).toList()

            ],
          ),
    );
  }

}