import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';

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
          const SizedBox(height: kDefaultPaddin),         
          Text(
            car.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: kTitle, fontWeight: FontWeight.bold),            
          ),
         const SizedBox(height: kDefaultPaddin),
         Text(
            car.description,
            style: const TextStyle(height: 1, color: kTitle),            
          ),
          const SizedBox(height: kDefaultPaddin*2),      
        ]
      ),
    );
  }
}
