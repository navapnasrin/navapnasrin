
import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/Billto_adress_fields.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/add_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/bill_to_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/country_picker.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/custom_bp.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';

import '../../../../../constants.dart';
import '../../../../../widgets/dialog_screen/cancel_btn.dart';
import '../../../../../widgets/dialog_screen/custom_dialog_widget.dart';
import '../../../../../widgets/dialog_screen/dialog_text_form.dart';
import '../../../../../widgets/dialog_screen/ok_btn.dart';

class BillToAddress extends StatefulWidget {
  const BillToAddress({super.key});

  @override
  State<BillToAddress> createState() => _BillToAddressState();
}
TextEditingController addressNameController=TextEditingController();
TextEditingController postalController=TextEditingController();
TextEditingController streetController=TextEditingController();

class _BillToAddressState extends State<BillToAddress> {
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

            BillToAddressFields()

            /*CustomBp(
              title: "Name",
              icon: Icons.arrow_forward_ios_outlined,
              onPress:() {
                showDialog(context: context,
                  builder: (context) =>
                      CustomDialogWidget(
                          text: 'Name', actions: [
                        DialogTextField(controller: addressNameController,
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
                                      builder: (context) => const BillToAddress()));
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
                         DialogTextField(controller: postalController,
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
                                       builder: (context) => const BillToAddress()));
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
                        DialogTextField(controller: streetController,
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
                                      builder: (context) => const BillToAddress()));
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

          ],
        ),
    ]
      ),
    );
  }
}
