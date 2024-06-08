/*import 'package:flutter/material.dart';
import 'package:my_sap_app/constants.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/add_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/custom_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/ship_to_address.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';

import '../../../../widgets/custom_more.dart';
import 'bill_to_adress.dart';

class ShipToScreen extends StatelessWidget {
  const ShipToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(text: "Ship To",
        action: [
          Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 30, 10),
              child: IconButton(
                  icon:Icon(Icons.check,
                    color: appBarColor,
                    size: MediaQuery.of(context).size.width*0.10 ,
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddBp()));
                  }
              )

          ),
        ],
      ),
      body:  Column(
        children: [
           const CustomBp(
               title: "Ship To",
           ),
          const SizedBox(height: 32.0,),

          CustomMoreField(onPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShipToAddress()));
          },
            title: "New Address",
          )
        ],
      ),
    );
  }
}*/
