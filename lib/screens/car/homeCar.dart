import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/screens/components/body.dart';
import 'package:shop_of_vehicles/screens/search/search.dart';
import 'package:shop_of_vehicles/screens/truck/homeTruck.dart';
import 'package:shop_of_vehicles/screens/ui/home/myDrawer.dart';
import 'package:shop_of_vehicles/screens/van/homeVan.dart';
import 'package:shop_of_vehicles/widgets/text/myText.dart';

class HomeCar extends StatelessWidget{
  const HomeCar({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: HomeDrawer(),
      body: const Body(typeVehicle: "car",),
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
          icon: const Icon(Icons.airport_shuttle),
          tooltip: textToolTipVan,
          //color: colorIconAppBar,
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
                builder: (context) => Search(typeVehicle: "car",),
              ),
            );
          },
        ),
      ],
    );
  }

}