import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/models/Vehicle.dart';
import 'package:shop_of_vehicles/widgets/text/myText.dart';

class ItemCard extends StatelessWidget {  
  final VoidCallback? press;
  final Vehicle vehicle;
  const ItemCard({Key? key, required this.vehicle, required this.press}) : super(key: key);  

  @override
  Widget build(BuildContext context) {    
    return GestureDetector(
      onTap: press,
      child: Card(          
          color: itemCardBackgroundCar,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Hero(
                  tag: "${vehicle.id}",
                  child: Image.asset(vehicle.image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPaddingTextObjectsHome, horizontal: kDefaultPaddin),
              child: MyBodyLargeText(
                text: vehicle.marca + " " + vehicle.modelo + " " + vehicle.anio,
                color: themeDrawerText,
                fontWeight: FontWeight.bold,
              ),              
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPaddingTextObjectsHome, horizontal: kDefaultPaddin),
              child: MyBodyLargeText(
                text: "\$${vehicle.price}",
                color: themeDrawerText,
                fontWeight: FontWeight.bold,
              ), 
            ),
            const SizedBox(height: 5),
          ],
        ),
      ), 
    );
  }

}