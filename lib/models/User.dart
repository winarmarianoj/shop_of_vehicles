import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/models/Contact.dart';

class User {  
  final int id;
  final String name, lastName, phone, email, password, street;
  final List<Contact> contacts;

  User({ required this.id, required this.name, required this.lastName,
  required this.phone, required this.email, required this.password, 
  required this.street, required this.contacts});


  User copyWith({ 
    String? name, lastName, phone, email, password, street,
    int? id,
    List<Contact>? contacts, 
  }) =>
    User(
    id: id?? this.id,
    name: name ?? this.name,
    lastName: lastName ?? this.lastName,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    password: password ?? this.password,
    street: street ?? this.street,
    contacts: contacts ?? this.contacts,
  );
}

addUser(User user){
  final newUser = [
      ...userList,
      user,
    ];
}

List<User> userList = [
    User(
        id: 1,
        name: "Pepe",
        lastName: "Argento",
        phone: "1122223333",
        email: "pepeargento@gmail.com",
        password: "1234567",
        street: "Argento 1234",
        contacts: [
                
        ]
    ),
    User(
        id: 2,
        name: "Monica",
        lastName: "De Argento",
        phone: "1144445555",
        email: "monicadeargento@gmail.com",
        password: "9876543",
        street: "Argento 1234",
        contacts: [
                
        ]
    ),
];