import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/models/Van.dart';
import 'package:shop_of_vehicles/screens/van/details/components/carouselVan.dart';
import 'package:shop_of_vehicles/screens/van/details/components/descriptionVan.dart';
import 'package:shop_of_vehicles/screens/van/details/components/priceAndContactVan.dart';

class DetailsBodyVan extends StatelessWidget {
  final Van van;
  const DetailsBodyVan({Key? key, required this.van}) : super(key: key);
  
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
                      DescriptionVan(van: van),
                      const SizedBox(height: kDefaultPaddin / 2),                                  
                      CarouselVan(van: van),
                      const SizedBox(height: kDefaultPaddin / 2),
                      PriceAndContactVan(van: van),
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