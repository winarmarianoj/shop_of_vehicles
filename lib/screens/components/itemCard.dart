import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/models/Van.dart';

class ItemCard extends StatelessWidget {  
  final VoidCallback? press;
  final int id;
  final String marca;
  final String modelo;
  const ItemCard({Key? key, required this.id, required this.marca, required this.modelo, required this.press}) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    String? marcas, modelos, anio, image, description, phone, email;
    int? price, size, ids;
    List<String>? photos;
    for (Truck truck in trucks) {
      if(truck.id == id && truck.marca == marca && truck.modelo == modelo){
        ids = truck.id; marcas = truck.marca; modelos = truck.modelo; anio= truck.anio; 
        image= truck.image; description= truck.description; phone=truck.phone;email= truck.email; 
        price= truck.price;size= truck.size;photos= truck.photos;
        break;
      }    
    }
    for (Van van in vans) {
      if(van.id == id && van.marca == marca && van.modelo == modelo){
        ids = van.id; marcas = van.marca; modelos = van.modelo; anio= van.anio; 
        image= van.image; description= van.description; phone=van.phone;email= van.email; 
        price= van.price;size= van.size;photos= van.photos;
        break;
      }    
    }
    for (Car car in cars) {
      if(car.id == id && car.marca == marca && car.modelo == modelo){
        ids = car.id; marcas = car.marca; modelos = car.modelo; anio= car.anio; 
        image= car.image; description= car.description; phone=car.phone;email= car.email; 
        price= car.price;size= car.size;photos= car.photos;
        break;
      }    
    }
    return ItemCardVehicle(id: ids!,marca: marcas!,modelo: modelos!,anio: anio!, 
      image: image!,description: description!,phone: phone!,email: email!, 
      price: price!,size: size!,photos: photos!, press: press,);
    
  }
}

class ItemCardVehicle extends StatelessWidget{
  final VoidCallback? press;
  final String marca, modelo, anio, image, description, phone, email;
  final int price, size, id;
  List<String> photos;
  ItemCardVehicle({Key? key, 
    required this.id,
    required this.marca,
    required this.image,
    required this.anio,
    required this.modelo,
    required this.price,
    required this.description,
    required this.size,
    required this.phone,
    required this.email,
    required this.photos,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return GestureDetector(
      onTap: press,
      child: Card(          
          color: itemCardBackgroundCar,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                //padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.symmetric(vertical: defaultPaddingImageObjectsHome, horizontal: defaultPaddingImageObjectsHome/2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Hero(
                  tag: "${id}",
                  child: Image.asset(image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPaddingTextObjectsHome, horizontal: kDefaultPaddin),
              child: RichText(
                text: TextSpan(
                  children: [                  
                    TextSpan(
                      text: marca + " " + modelo + " " + anio,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: themeDrawerText, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),    
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPaddingTextObjectsHome, horizontal: kDefaultPaddin),
              child: RichText(
                text: TextSpan(
                  children: [                  
                    TextSpan(
                      text: "\$${price}",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: themeDrawerText, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),   
            ),
            const SizedBox(height: 5),
          ],
        ),
      ), 
    );
  }

}