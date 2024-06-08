import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_sap_app/constants.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';

import '../main_menu.dart';
import '../popup_menu_items.dart';
class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(text: "Alerts",

        action: [
        PopupMenuButton(itemBuilder: (BuildContext context){
          return PopupMenuItems.activityItems.map((String activityItems){
            return PopupMenuItem(
              height: MediaQuery.of(context).size.height*0.070,
              child:Text(activityItems),
            );
          }).toList();
        },
          icon:const Icon(Icons.more_vert,color: appBarColor,),//surfaceTintColor: appBarColor,
        ),
    ],
          icon: IconButton(
            onPressed:()=>Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const MainMenuFields())),
            icon:const Icon(Icons.arrow_back_ios_new_outlined,
              color: appBarColor,size: 20.0,),),

      ),
      body: const Center(
        child: Text('Alerts'),
      ),
    );
  }
}