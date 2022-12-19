import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/screens/profile/profileUser.dart';
import 'package:shop_of_vehicles/screens/ui/home/myDrawer.dart';
import 'package:shop_of_vehicles/widgets/button/bounceButton.dart';
import 'package:shop_of_vehicles/widgets/message/customPopup.dart';

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
                  textWriterNewChangeByVariable + attribute + " :",
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
                          onChanged: (value) {changeNewAttribute(attribute, value, context);}
                        ), 
                        const SizedBox(height: 30),
                        BounceButton(
                          buttonSize: ButtonSize.small, 
                          type: ButtonType.primary, 
                          label: textSendDataButton,
                          iconLeft: Icons.send,
                          textColor: buttonInputText,
                          horizontalPadding: true,
                          contentBasedWidth: true,
                          onPressed:() {
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => ProfileUser())));
                          },
                        ),               
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
    case 'Nombre':
      context.read<UserCubit>().changeName(newAttribute);
      break;
      case 'Apellido':
      context.read<UserCubit>().changeLastName(newAttribute);
      break;
      case 'Telefono':
      context.read<UserCubit>().changePhone(newAttribute);
      break;
      case 'Email': 
      context.read<UserCubit>().changeEmail(newAttribute);
      break;
      case 'Password': 
      context.read<UserCubit>().changePassword(newAttribute);
      break;
      case 'Direccion': 
      context.read<UserCubit>().changeStreet(newAttribute);
      break;
    default:
      print(textTypeChangeNotExists);
      showDialog(context: context, 
        builder: (_) => CustomPopup(
            title: textTitleResultChangeNotExists,
            message: textTypeChangeNotExists,
            buttonAccept: BounceButton(
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogLogin,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
      ); 
      break;
  }

}
