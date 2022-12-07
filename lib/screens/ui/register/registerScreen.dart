import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/providers/registerFormProvider.dart';
import 'package:shop_of_vehicles/screens/ui/login/decorations/input_decorations.dart';
import 'package:shop_of_vehicles/screens/ui/login/widgets/auth_background.dart';
import 'package:shop_of_vehicles/screens/ui/login/widgets/card_container.dart';
import 'package:provider/provider.dart';
import 'package:shop_of_vehicles/screens/ui/register/decorations/registerDecorations.dart';
import 'package:shop_of_vehicles/screens/welcome/headerPage.dart';
import 'package:shop_of_vehicles/service/authenticationService.dart';
import 'package:shop_of_vehicles/utils/bounceButton.dart';
import 'package:shop_of_vehicles/utils/customPopup.dart';

class RegisterScreen extends StatelessWidget {
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
                    Text(
                      'Register',
                      style: Theme.of(context).textTheme.headline4,
                    ),
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

class RegisterForm extends StatelessWidget {  
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
              decoration: RegisterDecorations.registerDecoration(
                  hintText: 'ingrese su nombre',
                  labelText: 'Name',
                  prefixIcon: Icons.title),
              onChanged: (value) => registerForm.name = value,
              validator: (value) {
                String pattern = r'^[a-zA-Z ]{2,50}$';
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') && (value != null && value.length <= 50)
                    ? null
                    : 'El valor ingresado no es un texto valido';
              },
            ),
            const SizedBox(height: 10),
            TextFormField(           
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: RegisterDecorations.registerDecoration(
                  hintText: 'ingrese su apellido',
                  labelText: 'Apellido',
                  prefixIcon: Icons.title),
              onChanged: (value) => registerForm.lastName = value,
              validator: (value) {
                String pattern = r'^[a-zA-Z ]{2,50}$';
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') && (value != null && value.length <= 50)
                    ? null
                    : 'El valor ingresado no es un texto valido';
              },
            ),
            const SizedBox(height: 10),
            TextFormField(           
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: RegisterDecorations.registerDecoration(
                  hintText: 'ingrese su telefono',
                  labelText: 'Telefono',
                  prefixIcon: Icons.phone),
              onChanged: (value) => registerForm.phone = value,
              validator: (value) {
                String pattern = r'^[0-9]$';
                RegExp regExp = new RegExp(pattern);
                return (value != null && value.length <= 10)
                    ? null
                    : 'El valor ingresado no es un numero valido';
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'tuemail@gmail.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icons.alternate_email_rounded),
              onChanged: (value) => registerForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no es un correo valido';
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*****',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.remove_red_eye_outlined),
              onChanged: (value) => registerForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';
              },
            ),
            const SizedBox(height: 10),
            TextFormField(           
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: RegisterDecorations.registerDecoration(
                  hintText: 'ingrese su direccion',
                  labelText: 'Domicilio',
                  prefixIcon: Icons.home_max),
              onChanged: (value) => registerForm.street = value,
              validator: (value) {
                String pattern = r'^[a-zA-Z 0-9 ]{2,50}$';
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') && (value != null && value.length <= 50)
                    ? null
                    : 'El valor ingresado no es un texto valido';
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
                      //registerForm.isLoading = true;
                      Future.delayed(Duration(seconds: 5));
                      AuthenticationService service = AuthenticationService();
                      registerForm = service.getRegisterUser(registerForm, context);
                      if(registerForm.isLoading) {                        
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => HeadersPage())));
                      }else{
                        showDialog(context: context, 
                          builder: (_) => CustomPopup(
                              title: 'Resultado del Registro de Usuario',
                              message: 'Error en el proceso de registro. Incorrectos los datos. Vuelva a intentar.',
                              buttonAccept: BounceButton(
                                buttonSize: ButtonSize.small,
                                type: ButtonType.primary,
                                label: 'OK',
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