import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/screens/profile/input/inputText.dart';
import 'package:shop_of_vehicles/widgets/button/bounceButton.dart';

class ChangeProfileUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UserCubit>();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(textTitleChangeProfile, ),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.secondary, 
              label: textButtonChangeName,
              iconLeft: Icons.person,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Nombre",))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.secondary, 
              label: textButtonChangeLastName,
              iconLeft: Icons.person,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Apellido",))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.secondary, 
              label: textButtonChangePhone,
              iconLeft: Icons.phone,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Telefono",))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.secondary, 
              label: textButtonChangeEmail,
              iconLeft: Icons.email,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Email",))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.secondary, 
              label: textButtonChangePassword,
              iconLeft: Icons.password,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Password",))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.secondary, 
              label: textButtonChangeStreet,
              iconLeft: Icons.home_work,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Direccion",))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
        ],
      ),
          )),
    );
  }

}
