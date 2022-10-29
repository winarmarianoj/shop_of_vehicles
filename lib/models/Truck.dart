import 'package:flutter/material.dart';

class Truck {
  final String image, title, description, phone, email;
  final int price, size, id;
  final Color color;
  Truck({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
    required this.phone,
    required this.email,
  });
}

List<Truck> trucks = [
  Truck(
      id: 1,
      title: "Mercedes-Benz Actros 2041 mod 2011",
      price: 15000,
      size: 5,
      description: "Vendo Mercedes-Benz Actros 2041, mod 2011, 4×2,620.000 km reales,el camión cuenta con las 6 cubiertas nuevas a estrenar,climatizador Viesa,vigía de ruedas, baterias nuevas,Aire Acondicionado.Nada para hacerle,listo para salir a trabajar",
      image: "assets/truks/MB-Actros2041-2011.jpg",
      color: const Color(0xFF3D82AE),
      phone: "1100001111",
      email: "mercedesActros@gmail.com",),
  Truck(
      id: 2,
      title: "Iveco 320e180 Modelo 2002",
      price: 10000,
      size: 5,
      description: "Iveco 320e180 Modelo 2002 Titular al dia Motor nuevo Equipo hidraulico para batea Climatic neil",
      image: "assets/truks/Iveco-320e180-2002.jpg",
      color: const Color(0xFF3D82AE),
      phone: "1122223333",
      email: "iveco320e180@gmail.com",),
  Truck(
      id: 3,
      title: "Volvo fh 13 540 mod 2011",
      price: 14000,
      size: 5,
      description: "Volvo tractor Ocean Race disponible",
      image: "assets/truks/Volvo fh 13 540 2010.jpg",
      color: const Color(0xFF3D82AE),
      phone: "1133334444",
      email: "volvofh13540@gmail.com",),
  Truck(
      id: 4,
      title: "Iveco 450E 41HT MODELO 1998",
      price: 7500,
      size: 5,
      description: "Iveco 450E 41HT MODELO 1998 CAMION TRACTOR muy buen estado",
      image: "assets/truks/Iveco-450e41-1998.jpg",
      color: const Color(0xFF3D82AE),
      phone: "1155556666",
      email: "iveco140e41ht@gmail.com",),
  Truck(
      id: 5,
      title: "VW 17280-2011 2017",
      price: 11000,
      size: 5,
      description: "VW 17280-2011 2017 535.000 km Se recibe camioneta 2015 en adelante",
      image: "assets/truks/VW-17280-2017.jpg",
      color: const Color(0xFF3D82AE),
      phone: "1177778888",
      email: "vw17280@gmail.com",),
  Truck(
      id: 6,
      title: "Scania 113 modelo 95 con carrocería",
      price: 9000,
      size: 5,
      description: "Scania T 113 modelo 95 chasis largo con carrocería",
      image: "assets/truks/113-95.jpg",
      color: const Color(0xFF3D82AE),
      phone: "1199990000",
      email: "scaniat11395@gmail.com",),
];