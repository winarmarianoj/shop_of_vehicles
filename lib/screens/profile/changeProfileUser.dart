import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/screens/profile/input/inputText.dart';

class ChangeProfileUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UserCubit>();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Profile User'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(            
              child: Text('Cambiar Nombre', style: TextStyle(color: textLabelChangeProfile)),
              color: buttonChangeProfile,
              onPressed: () {                
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "name",))));
              }),
          MaterialButton(
              child: Text('Cambiar Apellido', style: TextStyle(color: textLabelChangeProfile)),
              color: buttonChangeProfile,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "lastName"))));
              }),
              MaterialButton(
              child: Text('Cambiar Teléfono', style: TextStyle(color: textLabelChangeProfile)),
              color: buttonChangeProfile,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: 'phone'))));
              }),
              MaterialButton(
              child: Text('Cambiar Email', style: TextStyle(color: textLabelChangeProfile)),
              color: buttonChangeProfile,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: 'email'))));
              }),
              MaterialButton(
              child: Text('Cambiar Password', style: TextStyle(color: textLabelChangeProfile)),
              color: buttonChangeProfile,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: 'password'))));
              }),
              MaterialButton(
              child: Text('Cambiar Dirección', style: TextStyle(color: textLabelChangeProfile)),
              color: buttonChangeProfile,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: 'street'))));
              }),
        ],
      )),
    );
  }

}
