import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/providers/loginFormProvider.dart';
import 'package:shop_of_vehicles/screens/ui/login/decorations/input_decorations.dart';
import 'package:shop_of_vehicles/screens/ui/login/widgets/auth_background.dart';
import 'package:shop_of_vehicles/screens/ui/login/widgets/card_container.dart';
import 'package:provider/provider.dart';
import 'package:shop_of_vehicles/screens/ui/register/registerScreen.dart';
import 'package:shop_of_vehicles/screens/welcome/headerPage.dart';
import 'package:shop_of_vehicles/service/authenticationService.dart';

import '../../../utils/bounceButton.dart';
import '../../../utils/customPopup.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(textTitle, style: Theme.of(context).textTheme.headline4,),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Text(textNewAccount, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                  disabledColor: themeLoginDisableButton,
                  elevation: 0,
                  color: themeRegisterButton,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 80,
                      vertical: 15),
                      child: Text(textButtonActionRegister ,                     
                        style: const TextStyle(color: themeLoginStateProccess),
                      )),                   
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => RegisterScreen())));
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loginForm = Provider.of<LoginFormProvider>(context);
    final usuarioCubit = context.read<UserCubit>();
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: textYouEmail,
                  labelText: textLabelTitleEmail,
                  prefixIcon: Icons.alternate_email_rounded),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern = textReggexPatternEmail;
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : textInvalidData;
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: textFormatPassword,
                  labelText: textLabelTitlePassword,
                  prefixIcon: Icons.remove_red_eye_outlined),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6) ? null : textInvalidDataPassword;
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: themeLoginDisableButton,
              elevation: 0,
              color: themeLoginSendButton,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 80,
                   vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Ingresando': 'Aceptar' ,                     
                    style: const TextStyle(color: themeLoginStateProccess),
                  )), 
              onPressed: loginForm.isLoading && loginForm.email.length!=0 && loginForm.password.length!=0
                  ? null
                  : () {
                      FocusScope.of(context).unfocus();
                      if (!loginForm.isValidForm()) return;                      
                      //loginForm.isLoading = true;
                      Future.delayed(Duration(seconds: 5));
                      // TODO: validar si el login es correcto 
                      AuthenticationService service = AuthenticationService();
                      loginForm = service.getLoginUser(loginForm, context);
                      if(loginForm.isLoading) {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => HeadersPage())));
                      }else{
                        showDialog(context: context, 
                          builder: (_) => CustomPopup(
                              title: textResultErrorLoginTitle,
                              message: textResultInvalidDataLogin,
                              buttonAccept: BounceButton(
                                buttonSize: ButtonSize.small,
                                type: ButtonType.primary,
                                label: textButtonShowDialogLogin,
                                onPressed: () {
                                  /*context.read<CreditCardListBloc>().add(
                                        CreditCardListEvent.toggleLock(
                                          card: card,
                                        ),
                                      );*/
                                  Navigator.pop(context);
                                },
                              ),
                            )
                        );                     
                      }
                  }                     
            ),
          ],
        ),
      ),      
    );    
  }
}