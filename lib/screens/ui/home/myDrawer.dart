import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/providers/loginFormProvider.dart';
import 'package:shop_of_vehicles/screens/ui/login/loginScreen.dart';

class HomeDrawer extends StatelessWidget {
  final LoginFormProvider loginForm;
  HomeDrawer({Key? key, required this.loginForm}) : super(key: key);

  final transitionDuration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          duration: transitionDuration,
          decoration: _coloredBackground(),
          child: Row(
            children: [
              Flexible(child: Text('Hola, ' + loginForm.email)),
            ],
          ),
        ),
        ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Logout'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
            }),
      ],
    ));
  }

  BoxDecoration _coloredBackground() => BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.lightBlue.shade400,
        Colors.lightBlue.shade200,
      ]));
}