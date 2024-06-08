import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/all_ship_to_address.dart';
import 'package:my_sap_app/services/ship_to_service.dart';

import '../../../../../constants.dart';
import '../../../../../model/ship_to_model.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../../../../../widgets/custom_submit_button.dart';
import '../../../../../widgets/custom_text_form.dart';
import 'country_picker.dart';

class UpdateShipToAddress extends StatefulWidget {
  const UpdateShipToAddress({super.key, required this.shipAdd});
  final ShipAdd shipAdd;

  @override
  State<UpdateShipToAddress> createState() => _UpdateShipToAddressState();
}

class _UpdateShipToAddressState extends State<UpdateShipToAddress> {


  TextEditingController shipAddressNameController = TextEditingController();
  TextEditingController shipPostalController = TextEditingController();
  TextEditingController shipStreetController = TextEditingController();

  final _shipToService = ShipToService();

  @override
  void initState(){
    setState((){

      shipAddressNameController.text=widget.shipAdd.name??" ";
      shipPostalController.text=widget.shipAdd.postalCode??"";
      shipStreetController.text=widget.shipAdd.street??"";
      selectCountry=widget.shipAdd.country!;
      selectState=widget.shipAdd.state!;
      selectCity=widget.shipAdd.city!;

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
        text: "Edit ShipTo Address",
        icon: IconButton(
        onPressed:()=>Navigator.push(context,
        MaterialPageRoute(builder: (context)=>const AllShipToAddress())),
    icon:const Icon(Icons.arrow_back_ios_new_outlined,color: appBarColor,size: 20.0,),
    ),),

      body:ListView(
        children: [
         Column(
          children: [
            SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: ListView(
                children: [
                  Column(
                    children: [
                      CustomTextFormField(
                        isObscure: false,
                        label: "Name",
                        controller: shipAddressNameController,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      const CountryPicker(),
                      const SizedBox(height: defaultPadding,),
                      CustomTextFormField(
                        isObscure: false,
                        label: "Street",
                        controller: shipStreetController,
                      ),
                      const SizedBox(height: defaultPadding,),
                      CustomTextFormField(
                        isObscure: false,
                        label: "Postal Code",
                        controller: shipPostalController,
                      ),
                      const SizedBox(height: defaultPadding,),

                      CustomSubmitButton(
                          text: "Update",
                          onTap: ()async {
                            var shipAdd = ShipAdd();
                            shipAdd.shipId=widget.shipAdd.shipId;
                            shipAdd.name = shipAddressNameController.text;
                            shipAdd.country = selectCountry;
                            shipAdd.state = selectState;
                            shipAdd.city = selectCity;
                            shipAdd.street = shipStreetController.text;
                            shipAdd.postalCode = shipPostalController.text;

                            var result = await _shipToService.updateShipTo(shipAdd);
                            Navigator.push(
                                context, MaterialPageRoute(builder: (result) => const AllShipToAddress()));
                            print(result);

                            setState(() {
                              shipAddressNameController.text = "";
                              shipStreetController.text = "";
                              shipPostalController.text = "";
                              selectCountry = "";
                              selectState = "";
                              selectCity = "";
                            });

                          })


                    ],
                  ),
                ],
              ),
            ),
            ),
          ],
        ),
    ]
      ),
    );
  }
}
