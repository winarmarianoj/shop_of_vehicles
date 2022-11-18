import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/models/Van.dart';

class ItemCardVan extends StatelessWidget {
  final Van? van;
  final VoidCallback? press;
  const ItemCardVan({
    Key? key,
    this.van,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(          
          color: itemCardBackgroundVan,
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
                  tag: "${van!.id}",
                  child: Image.asset(van!.image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
              child: Text(
                // products is out demo list
                van!.title,
                style: const TextStyle(color: kTextItemCardTitle),
              ),
            ),
            Text(
              "\$${van!.price}",
              style: const TextStyle(fontWeight: FontWeight.bold,
              color: kTextItemCardPrice),
            )
          ],
        ),
      ), 
    );
  }
}