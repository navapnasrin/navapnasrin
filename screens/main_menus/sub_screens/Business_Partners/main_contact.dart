/*import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sap_app/constants.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';
import 'package:my_sap_app/widgets/dialog_screen/cancel_btn.dart';
import 'package:my_sap_app/widgets/dialog_screen/custom_dialog_widget.dart';
import 'package:my_sap_app/widgets/dialog_screen/ok_btn.dart';

import '../../../../widgets/dialog_screen/new_btn.dart';
import 'bp_contact.dart';
import 'custom_bp.dart';

class MainContact extends StatelessWidget {
  const MainContact({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppbar(
          text: "All Contacts",
          ),
      body:Column(
        children: [
           const CustomBp(
            title: "Main Contact",

              ),
            const Divider(
              height: 30.0,
              thickness: 2.0,
              indent: 2.0,
              color: kPrimaryLightColor,
            ),
          CustomBp(title: 'Add Contact',
              onPress: (){
                showDialog(context: context,
                    builder: (context)=>  CustomDialogWidget(
                      text: 'Add Contact',
                        actions: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            NewBtn(
                              title: "New Contact",
                                onPressed: (){Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>const BpContact()));
                                }),
                          const SizedBox(height: 15.0,),
                          NewBtn(
                            title: 'Add Phone Book',
                              onPressed: (){})
                        ],
                      )
                    ],
                        width: MediaQuery.of(context).size.width*0.5,
                        height:MediaQuery.of(context).size.height*0.80 ),
                );


              }
              )
        ],
      )

    );
  }
}*/
