import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:shop_of_vehicles/models/Vehicle.dart';
import 'package:shop_of_vehicles/screens/components/detailsScreen.dart';
import 'package:shop_of_vehicles/screens/ui/home/myDrawer.dart';
import 'package:shop_of_vehicles/utils/getLists.dart';

class Search extends StatefulWidget{
  final String typeVehicle;
  const Search({Key? key, required this.typeVehicle}) : super(key: key);

  @override
  State<Search> createState() => FirstSearch(typeVehicle);
}

class FirstSearch extends State<Search>{
  TextEditingController searchController = TextEditingController();
  String typeVehicle;

  FirstSearch(this.typeVehicle);

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
                decoration: const InputDecoration(hintText: textDecorationHintTextSearch),
              ),
              Expanded(
                child: SearchVehicles(text: searchController.text, typeVehicle: typeVehicle,),
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
          onPressed: () {Navigator.pop(context);},
        ),        
      ],
    );
  }
}

class SearchVehicles extends StatelessWidget{
  final String text;
  final String typeVehicle;
  const SearchVehicles({Key? key, required this.text, required this.typeVehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Vehicle> vehicles = GetLists.getListTypeVehicles(typeVehicle);
    return FutureBuilder(
      initialData: vehicles,
      builder: ((context, snapshot) {
        List<Vehicle> vehiclesList = [];
        if(text.isNotEmpty){
          vehiclesList = vehicles.where((element) => 
                  element.marca.contains(text) ||
                  element.modelo.contains(text) ||
                  element.anio.contains(text))
                  .toList();
        }
        return ListView.builder(
          itemCount: vehiclesList.length,
          itemBuilder: (context, index) {
            var vehicle = vehiclesList[index];
            return TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(vehicle: vehicle,),
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
                          child: Icon(Icons.mobile_friendly),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vehicle.marca + " " + vehicle.modelo + " " + vehicle.anio,
                          ),
                          Text(vehicle.price.toString()),
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
