import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/providers/loginFormProvider.dart';
import 'package:shop_of_vehicles/screens/welcome/pages/objectAnimationWelcome.dart';

import '../truck/homeTruck.dart';

class HeadersPage extends StatelessWidget {
  final LoginFormProvider loginForm; 
  const HeadersPage({Key? key, required this.loginForm}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ObectAnimationWelcome(),      
    );    
  }
}
