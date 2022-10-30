import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/constant/constants.dart';

class CarouselTruck extends StatelessWidget {
  CarouselTruck({
    Key? key,
    required this.truck,
  }) : super(key: key);  

  final Truck truck;
  final truckImages = [
    'assets/truks/IvecoStralis380/1.jpg',
    'assets/truks/IvecoStralis380/2.jpg',
    'assets/truks/IvecoStralis380/3.jpg',
    'assets/truks/IvecoStralis380/4.jpg',
    'assets/truks/IvecoStralis380/5.jpg',
  ];

  @override
  Widget build(BuildContext context) {        
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(            
            child: CarouselSlider.builder(               
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                enlargeCenterPage: true,
                //reverse: true,
                //viewportFraction: 1,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlayInterval: Duration(seconds: 2),
              ),
              itemCount: truckImages.length,              
              itemBuilder:(context, index, realIndex) {
                return buildImage(truckImages[index]);
              },
            ), 
          ),
        ],
      ),
    );
  }

  Widget buildImage (String image) => Container(
    margin: EdgeInsets.symmetric(horizontal: 2),
    color: Colors.deepOrangeAccent,
    child: Image.asset(
      image,
      fit: BoxFit.cover,
    ),
  );
  
}
