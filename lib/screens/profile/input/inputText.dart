import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/screens/profile/profileUser.dart';
import 'package:shop_of_vehicles/screens/ui/home/myDrawer.dart';

class InputText extends StatelessWidget { 
  final String attribute;
  const InputText({Key? key, required this.attribute }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: HomeDrawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 130),
            Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  'Escriba su nuevo ' + attribute + " :",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Form(                      
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SizedBox(
                    width: 300,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );  
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: appBarBackground,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Vuelve atrás',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileUser(),
              ),
            );
          },
        ),        
      ],
    );
  }
  
}

void changeNewAttribute(String attribute, String newAttribute, BuildContext context){
  switch(attribute){
    case 'name':
      context.read<UserCubit>().changeName(newAttribute);
      break;
      case 'lastName':
      context.read<UserCubit>().changeLastName(newAttribute);
      break;
      case 'phone':
      context.read<UserCubit>().changePhone(newAttribute);
      break;
      case 'email': 
      context.read<UserCubit>().changeEmail(newAttribute);
      break;
      case 'password': 
      context.read<UserCubit>().changePassword(newAttribute);
      break;
      case 'street': 
      context.read<UserCubit>().changeStreet(newAttribute);
      break;
    default:
      'No existe lo solicitado';
      break;
  }

}
