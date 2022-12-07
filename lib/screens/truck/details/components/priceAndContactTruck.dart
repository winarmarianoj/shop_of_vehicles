import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/models/Contact.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceAndContactTruck extends StatelessWidget {
  PriceAndContactTruck({
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
          Row(            
            children: <Widget>[
              const SizedBox(height: kDefaultPaddin*6),
              const SizedBox(width: kDefaultPaddin), 
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Precio en Dolares\n"),   
                    TextSpan(
                      text: "\$${truck.price}",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: kTextItemCardPrice, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),    
              const SizedBox(width: kDefaultPaddin*4),      
              Container(
                margin: const EdgeInsets.only(right: kDefaultPaddin),
                height: 120,
                width: 70,
                /*decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: kTextItemCardTitle,
                  ),
                ),*/
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/smartphone.svg",
                    color: smartphoneColor,
                    height: 70,
                    width: 70,
                  ),
                  onPressed: () {
                    Contact contact = Contact(name: truck.name, lastname: truck.lastname, phone: truck.phone, email: truck.email);
                    context.read<UserCubit>().addContact(contact);
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: Text("Contacto del Propietario"),
                        content: Text("Name: ${truck.name}  Apellido: ${truck.lastname} \nPhone: ${truck.phone} \nEmail: ${truck.email}"),
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
