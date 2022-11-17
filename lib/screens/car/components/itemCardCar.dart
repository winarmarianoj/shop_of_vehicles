import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/constant/constants.dart';

class ItemCardCar extends StatelessWidget {
  final Car? car;
  final VoidCallback? press;
  const ItemCardCar({
    Key? key,
    this.car,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(          
          color: cardBackground,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                // For  demo we use fixed height  and width
                // Now we dont need them
                // height: 180,
                // width: 160,
                decoration: BoxDecoration(
                  //color: product!.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Hero(
                  tag: "${car!.id}",
                  child: Image.asset(car!.image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
              child: Text(
                // products is out demo list
                car!.title,
                style: const TextStyle(color: kTextItemCardTitle),
              ),
            ),
            Text(
              "\$${car!.price}",
              style: const TextStyle(fontWeight: FontWeight.bold,
              color: kTextItemCardPrice),
            )
          ],
        ),
      ), 
    );
  }
}