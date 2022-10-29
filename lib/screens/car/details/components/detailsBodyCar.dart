import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/screens/car/details/components/productAndImageCar.dart';
import 'package:shop_of_vehicles/screens/car/details/components/descriptionCar.dart';

class DetailsBodyCar extends StatelessWidget {
  final Car car;

  const DetailsBodyCar({Key? key, required this.car}) : super(key: key);
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
                    color: Colors.limeAccent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[                                            
                      DescriptionCar(car: car),
                      const SizedBox(height: kDefaultPaddin / 2),                                  
                      ProductAndImageCar(car: car),
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