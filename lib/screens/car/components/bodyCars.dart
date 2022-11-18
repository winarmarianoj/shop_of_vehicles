import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/screens/car/components/itemCardCar.dart';
import 'package:shop_of_vehicles/screens/car/details/detailsScreenCar.dart';

class BodyCars extends StatelessWidget{
  const BodyCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/image/fondo2.jpg",
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
                  itemCount: cars.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin/3,
                    crossAxisSpacing: kDefaultPaddin/3,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCardCar(
                    car: cars[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreenCar(
                          car: cars[index],
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