import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/models/User.dart';
import 'package:shop_of_vehicles/providers/loginFormProvider.dart';
import 'package:shop_of_vehicles/providers/registerFormProvider.dart';

class AuthenticationService {
  LoginFormProvider getLoginUser(LoginFormProvider loginForm, BuildContext context) {    
    final usuarioCubit = context.read<UserCubit>();    
    for (var users in userList) {
      if(loginForm.email == users.email && loginForm.password == users.password){        
        loginForm.isLoading = true;
        User newUser = users;
        usuarioCubit.createUser(newUser);
      }
    }
    return loginForm;
  }

  RegisterFormProvider getRegisterUser(RegisterFormProvider registerForm, BuildContext context) {
    final usuarioCubit = context.read<UserCubit>();
    bool result = false;
    for (var users in userList) {
      if(registerForm.email == users.email){
        result = true;
        break;
      }
    }
    if(!result){
      registerForm.isLoading=true;
      int ids = userList.length;
      User user = User(id: ids+1, name: registerForm.name, 
      lastName: registerForm.lastName, phone: registerForm.phone, 
      email: registerForm.email, password: registerForm.password, 
      street: registerForm.street, contacts: []);
      addUser(user);
      context.read<UserCubit>().createUser(user);
    }

    return registerForm;
  }  

}


