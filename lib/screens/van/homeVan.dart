import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/providers/loginFormProvider.dart';
import 'package:shop_of_vehicles/screens/car/homeCar.dart';
import 'package:shop_of_vehicles/screens/truck/homeTruck.dart';
import 'package:shop_of_vehicles/screens/ui/home/myDrawer.dart';
import 'package:shop_of_vehicles/screens/ui/login/loginScreen.dart';
import 'package:shop_of_vehicles/screens/van/components/bodyVans.dart';

class HomeVan extends StatelessWidget{
  final LoginFormProvider loginForm;
  const HomeVan({Key? key, required this.loginForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: HomeDrawer(),
      body: const BodyVans(),
    );
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: appBarBackground,
      elevation: 0,
      /*leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        tooltip: 'Vuelve atrás',
        onPressed: () {},
      ),*/
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.directions_car),
          tooltip: 'Home Cars',
          color: colorIconAppBar,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeCar(loginForm: loginForm,),
              ),
            );
          }, 
        ),
        IconButton(
          icon: const Icon(Icons.local_shipping),
          tooltip: 'Home Trucks',
          color: colorIconAppBar,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeTruck(loginForm: loginForm,),
              ),
            );
          }, 
        ),
        const SizedBox(width: kDefaultPaddin / 2),
        IconButton(
          icon: const Icon(Icons.search),
          color: colorIconAppBar,
          onPressed: () {
            /*Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );*/
          },
        ),
        const SizedBox(width: kDefaultPaddin / 2),
        IconButton(
          icon: const Icon(Icons.logout),
          color: colorIconAppBar,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
        const SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }

}