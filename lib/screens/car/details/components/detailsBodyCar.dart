import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/screens/car/details/components/carouselCar.dart';
import 'package:shop_of_vehicles/screens/car/details/components/priceAndContactCar.dart';
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
                Image.asset(
                  "assets/image/fondo2.jpg",
                  width: 500,
                  height: 800,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.04),
                  padding: EdgeInsets.only(
                    top: size.height * 0.04,
                    left: kDefaultPaddin/2,
                    right: kDefaultPaddin/2,
                  ),
                  height: 700,
                   decoration: const BoxDecoration(
                    color: kFondo,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[                                            
                      DescriptionCar(car: car),
                      const SizedBox(height: kDefaultPaddin / 2),                                  
                      CarouselCar(car: car),
                      const SizedBox(height: kDefaultPaddin / 2),
                      PriceAndContactCar(car: car),
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