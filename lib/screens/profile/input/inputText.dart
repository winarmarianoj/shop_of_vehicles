import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/screens/profile/profileUser.dart';

class InputText extends StatelessWidget { 
  final String attribute;
  const InputText({Key? key, required this.attribute }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UserCubit>();

    return Scaffold(
      body: Column(
            children: [
              SizedBox(height: 250),
              Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Escriba su nuevo ' + attribute + " :",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Form(                      
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              changeNewAttribute(attribute, value, context);
                            }
                          ),                          
                          const SizedBox(height: 30),
                          MaterialButton(
                              child: Text(
                                'Send Data',
                                style: TextStyle(color: textButtonInputText),
                              ),
                              color: buttonInputText,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: ((context) => ProfileUser())));
                              }),   
                        ],
                      ),
                    ),
                  ],
              ),
            ],
          ),
    );  
  }
  
}

void changeNewAttribute(String attribute, String newAttribute, BuildContext context){
  switch(attribute){
    case 'name':
      context.read<UserCubit>().changeName(attribute);
      break;
      case 'lastName':
      context.read<UserCubit>().changeLastName(attribute);
      break;
      case 'phone':
      context.read<UserCubit>().changePhone(attribute);
      break;
      case 'email': 
      context.read<UserCubit>().changeEmail(attribute);
      break;
      case 'password': 
      context.read<UserCubit>().changePassword(attribute);
      break;
      case 'street': 
      context.read<UserCubit>().changeStreet(attribute);
      break;
    default:
      'No existe lo solicitado';
      break;
  }

}
