
import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/country_picker.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/custom_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/ship_to_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/shipto_address_fields.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';

import '../../../../../constants.dart';
import '../../../../../widgets/dialog_screen/cancel_btn.dart';
import '../../../../../widgets/dialog_screen/custom_dialog_widget.dart';
import '../../../../../widgets/dialog_screen/dialog_text_form.dart';
import '../../../../../widgets/dialog_screen/ok_btn.dart';
import '../add_bp.dart';

class ShipToAddress extends StatefulWidget {
  const ShipToAddress({super.key});

  @override
  State<ShipToAddress> createState() => _ShipToAddressState();
}
TextEditingController shipToNameController=TextEditingController();
TextEditingController shipToPostalController=TextEditingController();
TextEditingController shipToStreetController=TextEditingController();

class _ShipToAddressState extends State<ShipToAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: "Address",
         icon: IconButton(
          onPressed:()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const AddBp())),
    icon:const Icon(Icons.arrow_back_ios_new_outlined,color: appBarColor,size: 20.0,),),


      ),

      body:  ListView(
          children:const [ Column(
            children: [
             ShipToAddressFields()
            ],
          ),
          ]
      ),
    );
  }
}
              /*CustomBp(
                title: "Name",
                icon: Icons.arrow_forward_ios_outlined,
                onPress:() {
                  showDialog(context: context,
                    builder: (context) =>
                        CustomDialogWidget(
                            text: 'Name', actions: [
                          DialogTextField(controller: shipToNameController,
                            hintText: "Required",
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CancelBtn(
                                  title: 'Cancel',
                                  onPress: () {
                                    Navigator.of(context).pop();
                                  }),
                              OkBtn(title: "ok",
                                  onPress: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => const ShipToAddress()));
                                  }),
                            ],
                          )
                        ],
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.5,
                            height: MediaQuery
                                .of(context)

                                .size
                                .height * 0.80),
                  );
                } ,
              ),

              const SizedBox(height: 16.0,),

              /*CustomBp(
              title: "Country/Region",
              icon: Icons.arrow_forward_ios_outlined,
              onPress:() {
                showDialog(context: context,
                  builder: (context) =>
                      CustomDialogWidget(
                          text: 'Name', actions: [
                        const CountryPicker(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CancelBtn(
                                title: 'Cancel',
                                onPress: () {
                                  Navigator.of(context).pop();
                                }),
                            OkBtn(title: "ok",
                                onPress: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => const NewAddress()));
                                }),
                          ],
                        )
                      ],
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.5,
                          height: MediaQuery
                              .of(context)

                              .size
                              .height * 0.80),
                );
              } ,
            ),*/
              const CountryPicker(),

              const SizedBox(height: 10.0,),

              CustomBp(
                title: "Postal Code",
                onPress: (){
                  showDialog(context: context,
                    builder: (context) =>
                        CustomDialogWidget(
                            text: 'Postal Code',
                            actions: [
                              DialogTextField(controller: shipToPostalController,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CancelBtn(
                                      title: 'Cancel',
                                      onPress: () {
                                        Navigator.of(context).pop();
                                      }),
                                  OkBtn(title: "ok",
                                      onPress: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => const ShipToAddress()));
                                      }),
                                ],
                              )
                            ],
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.5,
                            height: MediaQuery
                                .of(context)

                                .size
                                .height * 0.90),
                  );

                },
                icon: Icons.arrow_forward_ios_outlined,


              ),
              const SizedBox(height: 10.0,),

              CustomBp(
                title: "Street",
                icon: Icons.arrow_forward_ios_outlined,
                onPress:() {
                  showDialog(context: context,
                    builder: (context) =>
                        CustomDialogWidget(
                            text: 'Street', actions: [
                          DialogTextField(controller: shipToStreetController,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CancelBtn(
                                  title: 'Cancel',
                                  onPress: () {
                                    Navigator.of(context).pop();
                                  }),
                              OkBtn(title: "ok",
                                  onPress: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => const ShipToAddress()));
                                  }),
                            ],
                          )
                        ],
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.5,
                            height: MediaQuery
                                .of(context)

                                .size
                                .height * 0.80),
                  );
                } ,
              ),*/


