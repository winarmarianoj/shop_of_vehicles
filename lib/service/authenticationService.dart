import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/models/User.dart';
import 'package:shop_of_vehicles/providers/loginFormProvider.dart';

class AuthenticationService {
  get userList => User.userList;

  LoginFormProvider getLoginUser(LoginFormProvider loginForm, BuildContext context) {    
    final usuarioCubit = context.read<UserCubit>();    
    for (var users in userList) {
      if(loginForm.email == users.email && loginForm.password == users.password){
        print(loginForm.email + loginForm.password);
        print(users.email + users.password);
        loginForm.isLoading = true;
        User newUser = users;
        print(newUser.name + newUser.lastName);
        usuarioCubit.createUser(newUser);
      }
    }
    return loginForm;
  }
  

}