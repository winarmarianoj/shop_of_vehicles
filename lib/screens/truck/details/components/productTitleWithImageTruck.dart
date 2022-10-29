import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/screens/truck/details/components/addToCartTruck.dart';

class ProductTitleWithImageTruck extends StatelessWidget {
  const ProductTitleWithImageTruck({
    Key? key,
    required this.truck,
  }) : super(key: key);

  final Truck truck;

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
                  text: "\$${truck.price}",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
                    color: truck.color,
                  ),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/smartphone.svg",
                    color: truck.color,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddToCartTruck(
                          truck: truck,
                        ),
                      ),
                    );
                  },
                ),
              ),
             const SizedBox(width: kDefaultPaddin/2),
              Expanded(
                child: Hero(
                  tag: "${truck.id}",
                  child: Image.asset(
                    truck.image,
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
