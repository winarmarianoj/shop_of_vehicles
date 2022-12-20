import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/providers/registerFormProvider.dart';
import 'package:provider/provider.dart';
import 'package:shop_of_vehicles/widgets/ui/auth_background.dart';
import 'package:shop_of_vehicles/widgets/ui/card_container.dart';
import 'package:shop_of_vehicles/widgets/ui/inputDecorations.dart';
import 'package:shop_of_vehicles/screens/welcome/headerPage.dart';
import 'package:shop_of_vehicles/service/authenticationService.dart';
import 'package:shop_of_vehicles/widgets/button/bounceButton.dart';
import 'package:shop_of_vehicles/widgets/message/customPopup.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    Text(textTitleRegister, style: Theme.of(context).textTheme.headline4,),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => RegisterFormProvider(),
                      child: RegisterForm(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),              
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {  
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool passVisible = true;
  @override
  Widget build(BuildContext context) {    
     var registerForm = Provider.of<RegisterFormProvider>(context);     
    return Container(
      child: Form(
        key: registerForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(           
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: textHintTextNameRegister,
                  labelText: textLabelNameRegister,
                  prefixIcon: Icons.title),
              onChanged: (value) => registerForm.name = value,
              validator: (value) {
                String pattern = textRegexPatternByString;
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') && (value != null && value.length <= 50)
                    ? null
                    : textInvalidDataFormat;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(           
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: textHintTextLastNameRegister,
                  labelText: textLabelLastNameRegister,
                  prefixIcon: Icons.title),
              onChanged: (value) => registerForm.lastName = value,
              validator: (value) {
                String pattern = textRegexPatternByString;
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') && (value != null && value.length <= 50)
                    ? null
                    : textInvalidDataFormat;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(           
              autocorrect: false,
              keyboardType: TextInputType.phone,
              decoration: InputDecorations.authInputDecoration(
                  hintText: textHintTextPhoneRegister,
                  labelText: textLabelPhoneRegister,
                  prefixIcon: Icons.phone),
              onChanged: (value) => registerForm.phone = value,
              validator: (value) {
                String pattern = textRegexPatternByPhoneNumber;
                RegExp regExp = new RegExp(pattern);
                return (value != null && value.length <= 10)
                    ? null
                    : textPhoneInvalidDataFormat;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: textYouEmail,
                  labelText: textLabelTitleEmail,
                  prefixIcon: Icons.alternate_email_rounded),
              onChanged: (value) => registerForm.email = value,
              validator: (value) {
                String pattern = textRegexPatternEmail;                    
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : textInvalidData; },
            ),
            const SizedBox(height: 10),
            TextFormField(
              autocorrect: false,
              obscureText: passVisible,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: themeInputDecorationLogin),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: themeInputDecorationLogin, width: 2)),
                  hintText: textFormatPassword,
                  labelText: textLabelTitlePassword,
                  labelStyle: const TextStyle(color: themeInputDecorationLoginLabel),
                  prefixIcon: Icons.remove_red_eye_outlined != null
                      ? Icon(
                          Icons.remove_red_eye_outlined,
                          color: themeInputDecorationLogin,
                        )
                      : null,
                  suffixIcon: IconButton(
                    icon: Icon(
                      passVisible 
                        ? Icons.visibility
                        : Icons.visibility_off,
                        color: themeInputDecorationLogin,
                    ),
                    onPressed: (() {
                      setState(() {
                        passVisible = !passVisible;
                      });
                    })
                  ),
              ),
              onChanged: (value) => registerForm.password = value,
              validator: (value) {
                return (value != null && value.length > 6) ? null : textInvalidDataPassword; },
            ),
            const SizedBox(height: 10),
            TextFormField(           
              autocorrect: false,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: textHintTextStreetRegister,
                  labelText: textLabelStreetRegister,
                  prefixIcon: Icons.home_max),
              onChanged: (value) => registerForm.street = value,
              validator: (value) {
                String pattern = textRegexPatternByStringWithNumber;
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') && (value != null && value.length <= 50)
                    ? null
                    : textInvalidDataFormat;
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: themeLoginDisableButton,
              elevation: 0,
              color: themeRegisterButton,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 80,
                   vertical: 15),
                  child: Text(
                    registerForm.isLoading ? 'Ingresando': 'Registrarme' ,                     
                    style: const TextStyle(color: themeLoginStateProccess),
                  )), 
              onPressed: registerForm.isLoading && registerForm.email.length!=0 && registerForm.password.length!=0
                  ? null
                  : () {
                      FocusScope.of(context).unfocus();
                      if (!registerForm.isValidForm()) return;
                      Future.delayed(Duration(seconds: 5));
                      AuthenticationService service = AuthenticationService();
                      registerForm = service.getRegisterUser(registerForm, context);
                      if(registerForm.isLoading) {                        
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => HeadersPage())));
                      }else{
                        showDialog(context: context, 
                          builder: (_) => CustomPopup(
                              title: textResultErrorRegisterTitle,
                              message: textResultInvalidDataRegister,
                              buttonAccept: BounceButton(
                                buttonSize: ButtonSize.small,
                                type: ButtonType.primary,
                                label: textButtonShowDialogRegister,
                                onPressed: () {
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