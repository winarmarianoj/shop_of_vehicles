import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/screens/truck/components/item_card_truck.dart';
import 'package:shop_of_vehicles/screens/truck/details/detailsScreenTruck.dart';

class BodyTrucks extends StatelessWidget{
  const BodyTrucks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/image/fondo1.jpg",
          width: 600,
          height: 700,
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[        
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: GridView.builder(
                  itemCount: trucks.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin/3,
                    crossAxisSpacing: kDefaultPaddin/3,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCardTruck(
                    truck: trucks[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreenTruck(
                          truck: trucks[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],        
    ); 
  }
}