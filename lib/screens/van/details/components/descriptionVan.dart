import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/models/Van.dart';

class DescriptionVan extends StatelessWidget {
  const DescriptionVan({
    Key? key,
    required this.van,
  }) : super(key: key);

  final Van van;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[ 
          const SizedBox(height: kDefaultPaddin),         
          Text(
            van.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: kTitle, fontWeight: FontWeight.bold),            
          ),
         const SizedBox(height: kDefaultPaddin),
         Text(
            van.description,
            style: const TextStyle(height: 1, color: kTitle),            
          ),
          const SizedBox(height: kDefaultPaddin*2),      
        ]
      ),
    );
  }
}
