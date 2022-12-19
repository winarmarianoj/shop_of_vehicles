import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/models/Vehicle.dart';
import 'package:shop_of_vehicles/screens/components/detailsScreen.dart';
import 'package:shop_of_vehicles/screens/components/itemCard.dart';
import 'package:shop_of_vehicles/utils/getLists.dart';

class Body extends StatelessWidget{
  final String typeVehicle;
  const Body({Key? key, required this.typeVehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Vehicle> vehicles = GetLists.getListTypeVehicles(typeVehicle);
    
    return Stack(
      children: [
        Image.asset(
          "assets/image/texture.jpg",
          width: 600,
          height: 800,
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[        
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: GridView.builder(
                  itemCount: vehicles.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: defaultPaddingHome,
                    crossAxisSpacing: defaultPaddingHome,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    vehicle: vehicles[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          vehicle: vehicles[index],
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

