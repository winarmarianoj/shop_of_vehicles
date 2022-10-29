import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/screens/truck/details/components/productTitleWithImageTruck.dart';
import 'descriptionTruck.dart';

class DetailsBodyTruck extends StatelessWidget {
  final Truck truck;

  const DetailsBodyTruck({Key? key, required this.truck}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.11),
                  padding: EdgeInsets.only(
                    top: size.height * 0.10,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  height: 1000,
                   decoration: const BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[                                            
                      DescriptionTruck(truck: truck),
                      const SizedBox(height: kDefaultPaddin / 2),                                  
                      ProductTitleWithImageTruck(truck: truck),
                      //AddToCartTruck(truck: truck),
                      const SizedBox(height: kDefaultPaddin / 2),
                    ],
                  ),                  
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}