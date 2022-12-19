import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/models/User.dart';
import 'package:shop_of_vehicles/screens/profile/changeProfileUser.dart';
import 'package:shop_of_vehicles/screens/truck/homeTruck.dart';
import 'package:shop_of_vehicles/screens/ui/login/loginScreen.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
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
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [              
              Text("Datos de su perfil", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
              Divider(),
              ListTile( title: Text('Nombre: ${ user.name }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Apellido: ${ user.lastName }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Teléfono: ${ user.phone }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Email: ${ user.email }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Contraseña: ${ user.password }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Dirección: ${ user.street }',style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              Text('Contactos', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
              Divider(),
              ...user.contacts.map(
                (contact) => ListTile( title: Text(contact.name + " " + contact.lastname, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,),),
                                      subtitle: Text(contact.phone + " " + contact.email, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,),),
                                      )
              ).toList()              
            ],
          ),
    );
  }

}