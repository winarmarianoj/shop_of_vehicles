import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/models/Van.dart';

class CarouselVan extends StatelessWidget {
  CarouselVan({
    Key? key,
    required this.van,
  }) : super(key: key);  

  final Van van;

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
              itemCount: van.photos.length,              
              itemBuilder:(context, index, realIndex) {
                return buildImage(van.photos[index]);
              },
            ), 
          ),
        ],
      ),
    );
  }

  Widget buildImage (String image) => Container(
    margin: EdgeInsets.symmetric(horizontal: 2),
    color: Color.fromARGB(255, 137, 0, 248),
    child: Image.asset(
      image,
      fit: BoxFit.cover,
    ),
  );
  
}
