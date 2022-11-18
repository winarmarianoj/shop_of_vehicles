import 'package:flutter/material.dart';

class Truck {
  final String name, lastname, image, title, description, phone, email;
  final int price, size, id;
  final Color color;
  List<String> photos;
  Truck({
    required this.id,
    required this.name,
    required this.lastname,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
    required this.phone,
    required this.email,
    required this.photos,
  });
}

final truckImages = [
    'assets/truks/IvecoStralis380/1.jpg',
    'assets/truks/IvecoStralis380/2.jpg',
    'assets/truks/IvecoStralis380/3.jpg',
    'assets/truks/IvecoStralis380/4.jpg',
    'assets/truks/IvecoStralis380/5.jpg',
  ];

List<Truck> trucks = [
  Truck(
      id: 1,
      name: "Mercedes",
      lastname: "Benz",
      title: "MB 1620L 1999",
      price: 15000,
      size: 5,
      description: "Mercedes Benz 1620L 1999 con Volquete Baco Gomas 295 Excelente Recibo Camioneta",
      image: "assets/truks/MB1620l99/1.jpg",
      color: const Color(0xFF3D82AE),
      phone: "1100001111",
      email: "mercedesbenz1620l99Actros@gmail.com",
      photos: [
              'assets/truks/MB1620l99/1.jpg',
              'assets/truks/MB1620l99/2.jpg',
              'assets/truks/MB1620l99/3.jpg',
              'assets/truks/MB1620l99/4.jpg',
              'assets/truks/MB1620l99/5.jpg',
            ]),
  Truck(
      id: 2,
      name: "Iveco",
      lastname: "Stralis",
      title: "Iveco Stralis 380Hd",
      price: 10000,
      size: 5,
      description: "Iveco Stralis 380Hd Excelente Estado Servicio Completo Ruta 7 y Carril Ponce Camiones Mendoza",
      image: "assets/truks/IvecoStralis380/1.jpg",
      color: const Color(0xFF3D82AE),
      phone: "1122223333",
      email: "ivecostralis380@gmail.com",
      photos: [
              'assets/truks/IvecoStralis380/1.jpg',
              'assets/truks/IvecoStralis380/2.jpg',
              'assets/truks/IvecoStralis380/3.jpg',
              'assets/truks/IvecoStralis380/4.jpg',
              'assets/truks/IvecoStralis380/5.jpg',
            ]),
  Truck(
      id: 3,
      name: "Renault",
      lastname: "440",
      title: "Renault 440 2008",
      price: 14000,
      size: 5,
      description: "Renault 440 2008 Motor Volvo Listo para transferir Podría permutar ",
      image: "assets/truks/Renault4402008/1.jpg",
      color: const Color(0xFF3D82AE),
      phone: "1133334444",
      email: "renault440@gmail.com",
      photos: [
              'assets/truks/Renault4402008/1.jpg',
              'assets/truks/Renault4402008/2.jpg',
              'assets/truks/Renault4402008/3.jpg',
            ]),
  Truck(
      id: 4,
      name: "Iveco",
      lastname: "Cursor",
      title: "Iveco Cursor 330 2015",
      price: 7500,
      size: 5,
      description: "Tractor Original Primera Mano Llantas De Aluminio Alcoa Tanque De Combustible De 600Lts. De Aluminio Vigía De Motor Aire Acondicionado Climatizador Espectacular!!",
      image: "assets/truks/IvecoCursor3302015/1.jpg",
      color: const Color(0xFF3D82AE),
      phone: "1155556666",
      email: "ivecocursor3302015@gmail.com",
      photos: [
              'assets/truks/IvecoCursor3302015/1.jpg',
              'assets/truks/IvecoCursor3302015/2.jpg',
              'assets/truks/IvecoCursor3302015/3.jpg',
              'assets/truks/IvecoCursor3302015/4.jpg',
              'assets/truks/IvecoCursor3302015/5.jpg',
            ]),
  Truck(
      id: 5,
      name: "Scania",
      lastname: "114G 330",
      title: "Scania 114G 330 2000",
      price: 11000,
      size: 5,
      description: "Scania 114G 330 año 2000 impecable Motor a Acentar",
      image: "assets/truks/Scania114g3302000/1.jpg",
      color: const Color(0xFF3D82AE),
      phone: "1177778888",
      email: "scania114g330@gmail.com",
      photos: [
              'assets/truks/Scania114g3302000/1.jpg',
              'assets/truks/Scania114g3302000/2.jpg',
              'assets/truks/Scania114g3302000/3.jpg',
              'assets/truks/Scania114g3302000/4.jpg',
              'assets/truks/Scania114g3302000/5.jpg',
            ]),
  Truck(
      id: 6,
      name: "Ford",
      lastname: "1831 2006",
      title: "Ford 1831 2006",
      price: 9000,
      size: 5,
      description: "Ford 1831 2006 Chasis intermedio",
      image: "assets/truks/Ford18312006/1.jpg",
      color: const Color(0xFF3D82AE),
      phone: "1199990000",
      email: "ford18312006@gmail.com",
      photos: [
              'assets/truks/Ford18312006/1.jpg',
              'assets/truks/Ford18312006/2.jpg',
              'assets/truks/Ford18312006/3.jpg',
              'assets/truks/Ford18312006/4.jpg',
            ]),
];