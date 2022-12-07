import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/screens/components/description.dart';

class DetailsBody extends StatelessWidget {
  final int id;
  final String marca;
  final String modelo;
  const DetailsBody({Key? key, required this.id, required this.marca, required this.modelo}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          "assets/image/texture.jpg",
          width: 600,
          height: 700,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[          
              SizedBox(
                height: size.height,
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.04),
                  padding: EdgeInsets.only(
                    top: size.height * 0.04,
                    left: kDefaultPaddin/2,
                    right: kDefaultPaddin/2,
                  ),
                  height: 700,
                  decoration: const BoxDecoration(
                    color: kFondo,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[    
                      Description(id: id, marca: marca, modelo: modelo,),
                      const SizedBox(height: kDefaultPaddin / 2),                      
                    ],
                  ),                  
                ),
              )
            ],
          ),
        ),
      ],
    );    
  }
}