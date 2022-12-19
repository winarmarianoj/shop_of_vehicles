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
      elevation: 0,
      title: MyText(text: textTitleShopOfVans, color: kTextColor,),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.directions_car),
          tooltip: textToolTipCar,
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
