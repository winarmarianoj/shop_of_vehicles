import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/models/Van.dart';
import 'package:shop_of_vehicles/screens/van/components/itemCardVan.dart';
import 'package:shop_of_vehicles/screens/van/details/detailsScreenVan.dart';

class BodyVans extends StatelessWidget{
  const BodyVans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/image/cielo.jpg",
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
                  itemCount: vans.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin/3,
                    crossAxisSpacing: kDefaultPaddin/3,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCardVan(
                    van: vans[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreenVan(
                          van: vans[index],
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