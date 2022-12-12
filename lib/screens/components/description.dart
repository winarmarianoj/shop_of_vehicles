import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/cubit/userCubit.dart';
import 'package:shop_of_vehicles/models/Contact.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';
import 'package:shop_of_vehicles/constant/constantsText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_of_vehicles/models/Vehicle.dart';
import 'package:shop_of_vehicles/widgets/button/bounceButton.dart';
import 'package:shop_of_vehicles/widgets/message/customPopup.dart';
import 'package:shop_of_vehicles/widgets/text/myText.dart';

class Description extends StatelessWidget {
  final Vehicle vehicle;
  const Description({Key? key, required this.vehicle}) : super(key: key); 
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(            
            child: CarouselSlider.builder(               
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                enlargeCenterPage: true,
                //reverse: true,
                //viewportFraction: 1,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlayInterval: Duration(seconds: 2),
              ),
              itemCount: vehicle.photos.length,              
              itemBuilder:(context, index, realIndex) {
                return buildImage(vehicle.photos[index]);
              },
            ), 
          ), 
          const SizedBox(height: kDefaultPaddin/2),  
          Padding(
              padding: const EdgeInsets.fromLTRB(75.0, 10.0, 10.0, 10.0),
              child: MyTitleOrangeText(
                text: "${vehicle.marca} ${vehicle.modelo} ${vehicle.anio}",
                color: kTitle,
                fontWeight: FontWeight.bold,
              ),
          ),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),          
          Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 10.0),
              child: MyDescriptionOrangeText(
                text: vehicle.description,
                color: kDescription,
                fontWeight: FontWeight.bold,
              ),             
          ),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          Padding(
              padding: const EdgeInsets.fromLTRB(75.0, 10.0, 10.0, 10.0),
              child: MyPriceYellowText(
                  text: textLabelDescriptionVehicles + "\$" + vehicle.price.toString(),
                  color: kTextItemCardPrice,
                  fontWeight: FontWeight.normal,
                ),        
          ),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),                   
          Padding(
            padding: const EdgeInsets.fromLTRB(75.0, 35.0, 10.0, 10.0),
            child:  BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.primary, 
              label: textLabelButton,
              iconLeft: Icons.mobile_screen_share,
              textColor: buttonInputText,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Contact contact = Contact(name: vehicle.marca, lastname: vehicle.modelo, phone: vehicle.phone, email: vehicle.email);
                context.read<UserCubit>().addContact(contact);                  
                showDialog(context: context, 
                  builder: (_) => CustomPopup(
                      title: textShowDialogTitleAddContactProfile,
                      message: textShowDialogBodyAddContactProfile,
                      buttonAccept: BounceButton(
                        buttonSize: ButtonSize.small,
                        type: ButtonType.primary,
                        label: textButtonResponseShowDialog,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                );  
              },
            ),             
          ),     
        ],
      ),
    );
  }

  Widget buildImage (String image) => Container(
    margin: EdgeInsets.symmetric(horizontal: 2),
    color: carouselTruckBackground,
    child: Image.asset(
      image,
      fit: BoxFit.cover,
    ),
  );

}
