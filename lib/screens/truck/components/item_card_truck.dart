import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';

class ItemCardTruck extends StatelessWidget {
  final Truck? truck;
  final VoidCallback? press;
  const ItemCardTruck({
    Key? key,
    this.truck,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(          
          color: itemCardBackgroundTruck,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Hero(
                  tag: "${truck!.id}",
                  child: Image.asset(truck!.image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
              child: Text(
                truck!.title,
                style: const TextStyle(color: kTextItemCardTitle),
              ),
            ),
            Text(
              "\$${truck!.price}",
              style: const TextStyle(fontWeight: FontWeight.bold,
              color: kTextItemCardPrice),
            )
          ],
        ),
      ), 
    );
  }
}