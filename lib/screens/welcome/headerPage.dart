import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/providers/loginFormProvider.dart';
import 'package:shop_of_vehicles/screens/welcome/pages/objectAnimationWelcome.dart';

import '../truck/homeTruck.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ObectAnimationWelcome(),      
    );    
  }
}
