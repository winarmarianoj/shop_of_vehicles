import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_of_vehicles/constant/constants.dart';
import 'package:shop_of_vehicles/models/Van.dart';

class PriceAndContactVan extends StatelessWidget {
  PriceAndContactVan({
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
          Row(            
            children: <Widget>[
              const SizedBox(height: kDefaultPaddin*6),
              const SizedBox(width: kDefaultPaddin), 
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Precio en Pesos\n"),   
                    TextSpan(
                      text: "\$${van.price}",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: kTextItemCardPrice, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),    
              const SizedBox(width: kDefaultPaddin*2),      
              Container(
                margin: const EdgeInsets.only(right: kDefaultPaddin),
                height: 120,
                width: 120,
                /*decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: kTextItemCardTitle,
                  ),
                ),*/
                child: IconButton(
                  icon: 
                  //Icon(Icons.phonelink_ring),
                  //color: smartphoneColor,
                  SvgPicture.asset(
                    "assets/icons/smartphone.svg",
                    color: smartphoneColor,
                    height: 70,
                    width: 70,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: Text("Contacto del Propietario"),
                        content: Text("Name: ${van.name}  Apellido: ${van.lastname} \nPhone: ${van.phone} \nEmail: ${van.email}"),
                        actions: <Widget>[
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),              
            ],
          ),     
        ],
      ),
    );
  }  
}
