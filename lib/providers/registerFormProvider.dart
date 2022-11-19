import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  String name = '';
  String lastName = '';
  String phone = '';  
  String email = '';
  String password = '';
  String street = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$name - $lastName - $email - $password - $phone - $street');

    return formKey.currentState?.validate() ?? false;
  }
}
