/*import 'package:flutter/material.dart';
import 'package:my_sap_app/constants.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/add_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/custom_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bill_to_adress.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';
import 'package:my_sap_app/widgets/custom_more.dart';

class BillToScreen extends StatelessWidget {
  const BillToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(text: "Bill To",
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
             title: "Bill To",
           ),
          const SizedBox(height: 32.0,),

          CustomMoreField(onPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const BillToAddress()));
          },
            title: "New Address",
          )
        ],
      ),
    );
  }
}*/
