import 'package:flutter/material.dart';

class Car {
  final String marca, modelo, anio, image, description, phone, email;
  final int price, size, id;
  final Color color;
  List<String> photos;
  Car({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.image,
    required this.anio,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
    required this.phone,
    required this.email,
    required this.photos,
  });
}

List<Car> cars = [
  Car(
      id: 1,
      marca: "Volkswagen",
      modelo: "Tiguan Allspace",
      anio: "2021",
      price: 10900000,
      size: 12,
      description: "Volkswagen Tiguan Allspace 1.4 Tsi Trendline 150cv Dsg modelo 2021 48711 km",
      image: "assets/cars/VolkswagenTigualAllspace2021/1.jpg",
      color: const Color.fromARGB(255, 161, 17, 228),
      phone: "1101010101",
      email: "volkswagentiguanallspace@gmail.com",
      photos: [
              'assets/cars/VolkswagenTigualAllspace2021/1.jpg',
              'assets/cars/VolkswagenTigualAllspace2021/2.jpg',
              'assets/cars/VolkswagenTigualAllspace2021/3.jpg',
              'assets/cars/VolkswagenTigualAllspace2021/4.jpg',
              'assets/cars/VolkswagenTigualAllspace2021/5.jpg',
            ]),
  Car(
      id: 2,
      marca: "Toyota",
      modelo: "Corolla",
      anio: "2021",
      price: 7250000,
      size: 8,
      description: "Toyota Corolla 1.8 Xei Cvt Pack 140cv 2021 29120kms",
      image: "assets/cars/ToyotaCorolla2021/1.jpg",
      color: const Color.fromARGB(255, 161, 17, 228),
      phone: "1102020202",
      email: "toyotacorolla2021@gmail.com",
      photos: [
              'assets/cars/ToyotaCorolla2021/1.jpg',
              'assets/cars/ToyotaCorolla2021/2.jpg',
              'assets/cars/ToyotaCorolla2021/3.jpg',
              'assets/cars/ToyotaCorolla2021/4.jpg',
              'assets/cars/ToyotaCorolla2021/5.jpg',
            ]),
  Car(
      id: 3,
      marca: "Peugeot",
      modelo: "208",
      anio: "2021",
      price: 5450000,
      size: 10,
      description: "Peugeot 208 1.6 Feline Tiptronic 2021 7500kms",
      image: "assets/cars/Peugeot2082021/1.jpg",
      color: const Color.fromARGB(255, 161, 17, 228),
      phone: "1103030303",
      email: "peugeot2082021@gmail.com",
      photos: [
              'assets/cars/Peugeot2082021/1.jpg',
              'assets/cars/Peugeot2082021/2.jpg',
              'assets/cars/Peugeot2082021/3.jpg',
              'assets/cars/Peugeot2082021/4.jpg',
              'assets/cars/Peugeot2082021/5.jpg',
            ]),
  Car(
      id: 4,
      marca: "Fiat",
      modelo: "Cronos",
      anio: "2021",
      price: 4190000,
      size: 11,
      description: "Fiat Cronos 1.3 Gse Drive 2021 21000kms",
      image: "assets/cars/FiatCronos2021/1.jpg",
      color: const Color.fromARGB(255, 161, 17, 228),
      phone: "1104040404",
      email: "fiatcronos2021@gmail.com",
      photos: [
              'assets/cars/FiatCronos2021/1.jpg',
              'assets/cars/FiatCronos2021/2.jpg',
              'assets/cars/FiatCronos2021/3.jpg',
              'assets/cars/FiatCronos2021/4.jpg',
              'assets/cars/FiatCronos2021/5.jpg',
            ]),
  Car(
      id: 5,
      marca: "Ford",
      modelo: "Ka",
      anio: "2021",
      price: 3589900,
      size: 12,
      description: "Ford Ka 1.5 S5p 2021 20100kms",
      image: "assets/cars/FordKa2021/1.jpg",
      color: const Color.fromARGB(255, 161, 17, 228),
      phone: "1105050505",
      email: "fordka2021@gmail.com",
      photos: [
              'assets/cars/FordKa2021/1.jpg',
              'assets/cars/FordKa2021/2.jpg',
              'assets/cars/FordKa2021/3.jpg',
              'assets/cars/FordKa2021/4.jpg',
              'assets/cars/FordKa2021/5.jpg',
            ]),
  Car(
      id: 6,
      marca: "Chevrolet",
      modelo: "Trailblazer",
      anio: "2021",
      price: 13949900,
      size: 12,
      description: "Chevrolet Trailblazer 2.8 Nueva Ltz Tdci 200cv 2021 23100kms",
      image: "assets/cars/ChevroletTrailblazer2021/1.jpg",
      color: const Color.fromARGB(255, 161, 17, 228),
      phone: "1106060606",
      email: "chevrolettrailblazer2021@gmail.com",
      photos: [
              'assets/cars/ChevroletTrailblazer2021/1.jpg',
              'assets/cars/ChevroletTrailblazer2021/2.jpg',
              'assets/cars/ChevroletTrailblazer2021/3.jpg',
              'assets/cars/ChevroletTrailblazer2021/4.jpg',
              'assets/cars/ChevroletTrailblazer2021/5.jpg',
            ]),
];