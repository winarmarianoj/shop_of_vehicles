import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/models/Van.dart';
import 'package:shop_of_vehicles/screens/components/detailsScreen.dart';
import 'package:shop_of_vehicles/screens/ui/home/myDrawer.dart';
import 'package:shop_of_vehicles/screens/van/homeVan.dart';

class SearchVan extends StatefulWidget{
  const SearchVan({Key? key,}) : super(key: key);

  @override
  State<SearchVan> createState() => FirstSearch();
}

class FirstSearch extends State<SearchVan>{
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
      backgroundColor: appBarBackground,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Vuelve atrás',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeVan(),
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
      initialData: vans,
      builder: ((context, snapshot) {
        List<Van> vanList = [];
        if(text.isNotEmpty){
          vanList = vans.where((element) => 
                  element.marca.contains(text) ||
                  element.modelo.contains(text) ||
                  element.anio.contains(text))
                  .toList();
        }
        return ListView.builder(
          itemCount: vanList.length,
          itemBuilder: (context, index) {
            var van = vanList[index];
            return TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                    id: vanList[index].id,
                    marca: vanList[index].marca,
                    modelo: vanList[index].modelo,
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
                            van.marca + " " + van.modelo + " " + van.anio,
                          ),
                          Text(van.price.toString()),
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
