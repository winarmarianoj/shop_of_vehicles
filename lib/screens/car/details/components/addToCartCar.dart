import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/constant/constants.dart';

class AddToCartCar extends StatelessWidget {
  const AddToCartCar({Key? key,required this.car}) : super(key: key);
  final Car car;

  @override
  Widget build(BuildContext context) {    
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/2),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.11, left: size.width * 0.03),
                    padding: EdgeInsets.only(
                      top: size.height * 0.08,
                      left: kDefaultPaddin*2,
                      right: kDefaultPaddin,
                    ),
                    height: 500,
                     decoration: const BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[                                                                  
                        RichText(
                          text: TextSpan(
                            children: [                            
                              TextSpan(
                                text: "Phone\n",
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: car.phone,
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),          
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Email\n",
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: Colors.indigoAccent, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: car.email,
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: Colors.indigoAccent, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),          
                        /*Text(                        
                          truck.phone,
                          style: const TextStyle(height: 4),            
                        ),
                        const SizedBox(height: kDefaultPaddin),    
                        Text(
                          truck.email,
                          style: const TextStyle(height: 4),            
                        ),
                        const SizedBox(height: kDefaultPaddin),    */

                      ],
                    ),                  
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}
