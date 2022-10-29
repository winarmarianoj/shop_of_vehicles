import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/constant/constants.dart';

class DescriptionCar extends StatelessWidget {
  const DescriptionCar({
    Key? key,
    required this.car,
  }) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            car.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
         const SizedBox(height: kDefaultPaddin/3),
         Text(
            car.description,
            style: const TextStyle(height: 1),            
          ),
          const SizedBox(height: kDefaultPaddin),      
        ]
      ),
    );
  }
}
