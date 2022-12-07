import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/screens/truck/components/bodyTrucks.dart';
import 'package:shop_of_vehicles/screens/car/homeCar.dart';
import 'package:shop_of_vehicles/screens/ui/home/myDrawer.dart';
import 'package:shop_of_vehicles/screens/van/homeVan.dart';

class HomeTruck extends StatelessWidget{  
  const HomeTruck({Key? key, })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: HomeDrawer(),
      body: const BodyTrucks(),
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
          icon: const Icon(Icons.airport_shuttle),
          tooltip: 'Home Vans',
          color: colorIconAppBar,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeVan(),
              ),
            );
          },         
        ),
        IconButton(
          icon: const Icon(Icons.directions_car),
          tooltip: 'Home Cars',
          color: colorIconAppBar,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeCar(),
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
      ],
    );
  }

}
