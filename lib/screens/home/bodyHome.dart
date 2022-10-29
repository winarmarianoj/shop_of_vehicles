import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constants.dart';

class BodyHome extends StatelessWidget{
  const BodyHome({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Stack(      
      children: [
        Image.asset(
          "assets/image/fondo.jpg",
          width: 600,
          height: 800,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Bienvenido al Shopping de Vehiculos en Argentina",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ]
          ),
      )],
    );
  }


}