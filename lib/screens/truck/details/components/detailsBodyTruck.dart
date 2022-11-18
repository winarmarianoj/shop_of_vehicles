import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/screens/truck/details/components/carouselTruck.dart';
import 'package:shop_of_vehicles/screens/truck/details/components/priceAndContactTruck.dart';
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
                Image.asset(
                  "assets/image/fondoTrucks.jpg",
                  width: 600,
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
                      DescriptionTruck(truck: truck),
                      const SizedBox(height: kDefaultPaddin / 2),                                  
                      CarouselTruck(truck: truck),
                      const SizedBox(height: kDefaultPaddin / 2),
                      PriceAndContactTruck(truck: truck),
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