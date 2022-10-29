import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/screens/home/bodyHome.dart';
import 'package:shop_of_vehicles/screens/car/homeCar.dart';
import 'package:shop_of_vehicles/screens/truck/homeTruck.dart';

class Home extends StatelessWidget{
  /*static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => const Home(),
    );
  }*/
    
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const BodyHome(),
    );
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 15, 157, 228),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/camioneta.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/coche.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeCar(
                  context,
                ),
              ),
            );
          },
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/truck.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeTruck(
                  context,
                ),
              ),
            );
          },
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }

}