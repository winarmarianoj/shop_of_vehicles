import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/constant/constants.dart';

class DescriptionTruck extends StatelessWidget {
  const DescriptionTruck({
    Key? key,
    required this.truck,
  }) : super(key: key);

  final Truck truck;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            truck.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
         const SizedBox(height: kDefaultPaddin/3),
         Text(
            truck.description,
            style: const TextStyle(height: 1),            
          ),
          const SizedBox(height: kDefaultPaddin),      
        ]
      ),
    );
  }
}
