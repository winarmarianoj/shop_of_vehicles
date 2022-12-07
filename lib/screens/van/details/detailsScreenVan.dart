import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/models/Van.dart';
import 'package:shop_of_vehicles/screens/van/details/components/detailsBodyVan.dart';

class DetailsScreenVan extends StatelessWidget {
  final Van van;
  const DetailsScreenVan({Key? key, required this.van}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      //backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: DetailsBodyVan(van: van),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      //backgroundColor: truck.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: buttonBackVan,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}