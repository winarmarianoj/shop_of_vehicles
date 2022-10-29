import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/screens/car/components/itemCardCar.dart';
import 'package:shop_of_vehicles/screens/car/details/detailsScreenCar.dart';

class BodyCars extends StatelessWidget{
  const BodyCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: cars.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
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
    );
  }
}