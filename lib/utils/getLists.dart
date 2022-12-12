import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/models/Van.dart';
import 'package:shop_of_vehicles/models/Vehicle.dart';

class GetLists{
  static getListTypeVehicles(String type){
    if(type == "truck"){
      return getVehiclesFromTrucks();
    }else if(type == "car"){
      return getVehiclesFromCars();
    }else if(type == "van"){
      return getVehiclesFromVans();
    }
  }
}
List<Vehicle> getVehiclesFromTrucks(){
  List<Vehicle> vehicles = [];
  trucks.forEach((element) {
    Vehicle vehicle = Vehicle(id: element.id, marca: element.marca, image: element.image, 
    anio: element.anio, modelo: element.modelo, price: element.price, 
    description: element.description, size: element.size, 
    color: element.color, phone: element.phone, email: element.email, photos: element.photos);
    vehicles.add(vehicle);
  });
  return vehicles;
}
List<Vehicle> getVehiclesFromCars(){
  List<Vehicle> vehicles = [];
  cars.forEach((element) {
    Vehicle vehicle = Vehicle(id: element.id, marca: element.marca, image: element.image, 
    anio: element.anio, modelo: element.modelo, price: element.price, 
    description: element.description, size: element.size, 
    color: element.color, phone: element.phone, email: element.email, photos: element.photos);
    vehicles.add(vehicle);
  });
  return vehicles;
}
List<Vehicle> getVehiclesFromVans(){
  List<Vehicle> vehicles = [];
  vans.forEach((element) {
    Vehicle vehicle = Vehicle(id: element.id, marca: element.marca, image: element.image, 
    anio: element.anio, modelo: element.modelo, price: element.price, 
    description: element.description, size: element.size, 
    color: element.color, phone: element.phone, email: element.email, photos: element.photos);
    vehicles.add(vehicle);
  });
  return vehicles;
}