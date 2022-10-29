import 'package:flutter/material.dart';

class Car {
  final String image, title, description, phone, email;
  final int price, size, id;  
  final Color color;
  Car({
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

List<Car> cars = [
  Car(
      id: 1,
      title: "Vento 2.0tdi caja de 6ta 2009",
      price: 9000,
      size: 12,
      description: "Vento 2.0tdi caja de 6ta 2009",
      image: "assets/cars/Vento 2.0-2009.jpg",
      color: const Color.fromARGB(255, 161, 17, 228),
      phone: "1101010101",
      email: "vento20tdi@gmail.com",),
  Car(
      id: 2,
      title: "Vendo corsa clasic 2014 con gnc",
      price: 10000,
      size: 8,
      description: "Vendo corsa clasic 2014 con gnc",
      image: "assets/cars/Corsa clasic 2014.jpg",
      color: const Color.fromARGB(255, 161, 17, 228),
      phone: "1102020202",
      email: "chevroletcorsa@gmail.com",),
  Car(
      id: 3,
      title: "Vendo Peugeot 307 xs 1.6 modelo 2009 ",
      price: 14000,
      size: 10,
      description: "Vendo Peugeot 307 xs 1.6 modelo 2009 ",
      image: "assets/cars/Peugeot 307-2009.jpg",
      color: const Color.fromARGB(255, 161, 17, 228),
      phone: "1103030303",
      email: "peugeot307@gmail.com",),
  Car(
      id: 4,
      title: "Gol 97 gnc junta tapa soplada escuchó oferta",
      price: 7500,
      size: 11,
      description: "Gol 97 gnc junta tapa soplada escuchó oferta",
      image: "assets/cars/Gol 97.jpg",
      color: const Color.fromARGB(255, 161, 17, 228),
      phone: "1104040404",
      email: "vwgol97@gmail.com",),
  Car(
      id: 5,
      title: "VW Suran 2010",
      price: 11000,
      size: 12,
      description: "VW Suran 2010",
      image: "assets/cars/Suran 2010.jpg",
      color: const Color.fromARGB(255, 161, 17, 228),
      phone: "1105050505",
      email: "vwsuran2010@gmail.com",),
  Car(
      id: 6,
      title: "Fiat Siena 1997",
      price: 9000,
      size: 12,
      description: "Fiat Siena 1997",
      image: "assets/cars/Siena 97.jpg",
      color: const Color.fromARGB(255, 161, 17, 228),
      phone: "1106060606",
      email: "fiatsiena97@gmail.com",),
];