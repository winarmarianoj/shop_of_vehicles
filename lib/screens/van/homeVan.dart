import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/screens/car/homeCar.dart';
import 'package:shop_of_vehicles/screens/components/body.dart';
import 'package:shop_of_vehicles/screens/search/search.dart';
import 'package:shop_of_vehicles/screens/truck/homeTruck.dart';
import 'package:shop_of_vehicles/screens/ui/home/myDrawer.dart';
import 'package:shop_of_vehicles/widgets/text/myText.dart';

class HomeVan extends StatelessWidget{
  const HomeVan({Key? key, }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: HomeDrawer(),
      body: const Body(typeVehicle: "van",),
    );
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      //backgroundColor: appBarBackground,
      elevation: 0,
      /*leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        tooltip: 'Vuelve atrás',
        onPressed: () {},
      ),*/
      title: MyText(text: textTitleShopOfCars, color: kTextColor,),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.directions_car),
          tooltip: textToolTipCar,
          //color: colorIconAppBar,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeCar(),
              ),
            );
          }, 
        ),
        IconButton(
          icon: const Icon(Icons.local_shipping),
          tooltip: textToolTipTruck,
          //color: colorIconAppBar,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeTruck(),
              ),
            );
          }, 
        ),
        const SizedBox(width: kDefaultPaddin / 2),
        IconButton(
          icon: const Icon(Icons.search),
          //color: colorIconAppBar,
          tooltip: textToolTipSearch,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Search(typeVehicle: "van",),
              ),
            );
          },
        ),
      ],
    );
  }  
}
