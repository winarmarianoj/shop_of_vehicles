import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/screens/truck/details/components/detailsBodyTruck.dart';

class DetailsScreenTruck extends StatelessWidget {
  final Truck truck;
  const DetailsScreenTruck({Key? key, required this.truck}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: DetailsBodyTruck(truck: truck),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      //backgroundColor: truck.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: buttonBackTruck,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}