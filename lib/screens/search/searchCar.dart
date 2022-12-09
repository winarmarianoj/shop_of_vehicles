import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/models/Car.dart';
import 'package:shop_of_vehicles/screens/car/homeCar.dart';
import 'package:shop_of_vehicles/screens/components/detailsScreen.dart';
import 'package:shop_of_vehicles/screens/ui/home/myDrawer.dart';

class SearchCar extends StatefulWidget{
  const SearchCar({Key? key,}) : super(key: key);

  @override
  State<SearchCar> createState() => FirstSearch();
}

class FirstSearch extends State<SearchCar>{
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: HomeDrawer(),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Column(
            children: [
              TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(hintText: "Buscar"),
              ),
              Expanded(
                child: SearchVehicles(text: searchController.text,),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      //backgroundColor: appBarBackground,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Vuelve atrás',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeCar(),
              ),
            );
          },
        ),        
      ],
    );
  }
}

class SearchVehicles extends StatelessWidget{
  final String text;
  SearchVehicles({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      initialData: cars,
      builder: ((context, snapshot) {
        List<Car> carList = [];
        if(text.isNotEmpty){
          carList = cars.where((element) => 
                  element.marca.contains(text) ||
                  element.modelo.contains(text) ||
                  element.anio.contains(text))
                  .toList();
        }
        return ListView.builder(
          itemCount: carList.length,
          itemBuilder: (context, index) {
            var car = carList[index];
            return TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                    id: carList[index].id,
                    marca: carList[index].marca,
                    modelo: carList[index].modelo,
                  ),
                ),
              ),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            car.marca + " " + car.modelo + " " + car.anio,
                          ),
                          Text(car.price.toString()),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        );        
      })
    );    
  }
}
