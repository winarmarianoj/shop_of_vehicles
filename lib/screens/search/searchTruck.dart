import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/models/Truck.dart';
import 'package:shop_of_vehicles/screens/components/detailsScreen.dart';
import 'package:shop_of_vehicles/screens/truck/homeTruck.dart';
import 'package:shop_of_vehicles/screens/ui/home/myDrawer.dart';

class SearchTruck extends StatefulWidget{
  const SearchTruck({Key? key,}) : super(key: key);

  @override
  State<SearchTruck> createState() => FirstSearch();
}

class FirstSearch extends State<SearchTruck>{
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(223, 124, 37, 37),
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
                /* style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(color: kTitle, fontWeight: FontWeight.bold) */
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
                builder: (context) => HomeTruck(),
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
      initialData: trucks,
      builder: ((context, snapshot) {
        List<Truck> truckList = [];
        if(text.isNotEmpty){
          truckList = trucks.where((element) => 
                  element.marca.contains(text) ||
                  element.modelo.contains(text) ||
                  element.anio.contains(text))
                  .toList();
        }
        return ListView.builder(
          itemCount: truckList.length,
          itemBuilder: (context, index) {
            var truck = truckList[index];
            return TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                    id: truckList[index].id,
                    marca: truckList[index].marca,
                    modelo: truckList[index].modelo,
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
                            truck.marca + " " + truck.modelo + " " + truck.anio,
                          ),
                          Text(truck.price.toString()),
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

