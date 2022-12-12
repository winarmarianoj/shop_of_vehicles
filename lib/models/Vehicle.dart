import 'package:flutter/material.dart';

class Vehicle {
  final String marca, modelo, anio, image, description, phone, email;
  final int price, size, id;
  final Color color;
  List<String> photos;
  Vehicle({
    required this.id,
    required this.marca,
    required this.image,
    required this.anio,
    required this.modelo,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
    required this.phone,
    required this.email,
    required this.photos,
  });
}