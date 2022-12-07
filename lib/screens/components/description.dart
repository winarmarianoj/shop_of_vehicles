import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/models/Contact.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_of_vehicles/models/Van.dart';

class Description extends StatelessWidget {
  final int id;
  final String marca;
  final String modelo;
  const Description({Key? key, required this.id, required this.marca, required this.modelo}) : super(key: key);  

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
    return DescriptionVehicle(id: ids!,marca: marcas!,modelo: modelos!,anio: anio!, 
      image: image!,description: description!,phone: phone!,email: email!, 
      price: price!,size: size!,photos: photos!);
    
  }  
}

class DescriptionVehicle extends StatelessWidget{
  final String marca, modelo, anio, image, description, phone, email;
  final int price, size, id;
  List<String> photos;
  DescriptionVehicle({Key? key, 
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
  }) : super(key: key);  
  
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
              itemCount: photos.length,              
              itemBuilder:(context, index, realIndex) {
                return buildImage(photos[index]);
              },
            ), 
          ), 
          const SizedBox(height: kDefaultPaddin),  
          Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPaddingTextObjectsHome, horizontal: kDefaultPaddin),
              child: Text(
                marca + " " + modelo + " " + anio,
                style: Theme.of(context).textTheme.headline4
                    ?.copyWith(color: kTitle, fontWeight: FontWeight.bold),            
              ),
          ),
         const SizedBox(height: kDefaultPaddin),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPaddingTextObjectsHome, horizontal: kDefaultPaddin),
              child: Text(
                description,
                style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(color: kTitle, fontWeight: FontWeight.bold),               
              ),
          ),
          const SizedBox(height: kDefaultPaddin*2),                   
          Row(            
            children: <Widget>[
              const SizedBox(height: kDefaultPaddin*6),
              const SizedBox(width: kDefaultPaddin), 
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Precio en Dolares\n"), 
                    TextSpan(
                      text: "\$${price}",
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
                    Contact contact = Contact(name: marca, lastname: modelo, phone: phone, email: email);
                    context.read<UserCubit>().addContact(contact);
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: Text("Contacto del Propietario"),
                        content: Text("Ya se ha agregado el contacto a su perfil de Contactos."),
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

  Widget buildImage (String image) => Container(
    margin: EdgeInsets.symmetric(horizontal: 2),
    color: carouselTruckBackground,
    child: Image.asset(
      image,
      fit: BoxFit.cover,
    ),
  );

}
