import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/constant/constants.dart';

class CarouselCar extends StatelessWidget {
  CarouselCar({
    Key? key,
    required this.car,
  }) : super(key: key);  

  final Car car;

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
                height: 250,
                autoPlay: true,
                enlargeCenterPage: true,
                //reverse: true,
                //viewportFraction: 1,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlayInterval: Duration(seconds: 2),
              ),
              itemCount: car.photos.length,              
              itemBuilder:(context, index, realIndex) {
                return buildImage(car.photos[index]);
              },
            ), 
          ),
        ],
      ),
    );
  }

  Widget buildImage (String image) => Container(
    margin: EdgeInsets.symmetric(horizontal: 2),
    color: carouselCarBackground,
    child: Image.asset(
      image,
      fit: BoxFit.cover,
    ),
  );
  
}
