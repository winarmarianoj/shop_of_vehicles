import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/models/Vehicle.dart';
import 'package:shop_of_vehicles/screens/components/detailsBody.dart';
import 'package:shop_of_vehicles/screens/ui/home/myDrawer.dart';

class DetailsScreen extends StatelessWidget {
  final Vehicle vehicle;
  const DetailsScreen({Key? key, required this.vehicle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: HomeDrawer(),
      body: DetailsBody(vehicle: vehicle,),
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