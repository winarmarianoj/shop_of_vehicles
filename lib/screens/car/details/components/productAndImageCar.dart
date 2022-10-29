import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/screens/car/details/components/addToCartCar.dart';

class ProductAndImageCar extends StatelessWidget {
  const ProductAndImageCar({
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
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: "Dolars Price\n"),
                TextSpan(
                  text: "\$${car.price}",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),              
          Row(            
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: kDefaultPaddin),
                height: 80,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: car.color,
                  ),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/smartphone.svg",
                    color: car.color,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddToCartCar(
                          car: car,
                        ),
                      ),
                    );
                  },
                ),
              ),
             const SizedBox(width: kDefaultPaddin/2),
              Expanded(
                child: Hero(
                  tag: "${car.id}",
                  child: Image.asset(
                    car.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),     
        ],
      ),
    );
  }
}
