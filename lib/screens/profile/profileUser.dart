import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/models/User.dart';
import 'package:shop_of_vehicles/screens/profile/changeProfileUser.dart';
import 'package:shop_of_vehicles/screens/truck/homeTruck.dart';

class ProfileUser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(textTitleProfile),
        actions: [          
          IconButton(
            icon: const Icon(Icons.local_shipping),
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
            icon: Icon( Icons.logout), 
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
        child: Icon( Icons.accessibility_new ),
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
    return 
    Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.normal ) ),
              Divider(),

              ListTile( title: Text('Nombre: ${ user.name }') ),
              ListTile( title: Text('Apellido: ${ user.lastName }') ),
              ListTile( title: Text('Teléfono: ${ user.phone }') ),
              ListTile( title: Text('Email: ${ user.email }') ),
              ListTile( title: Text('Contraseña: ${ user.password }') ),
              ListTile( title: Text('Dirección: ${ user.street }') ),

              Text('Contactos', style: TextStyle( fontSize: 18, fontWeight: FontWeight.normal ) ),
              Divider(),
              ...user.contacts.map(
                (contact) => ListTile( title: Text( contact.name + " " + contact.lastname ),
                                      subtitle: Text(contact.phone + " " + contact.email),)
              ).toList()

            ],
          ),
    );
  }

}