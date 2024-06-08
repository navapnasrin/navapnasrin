import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../widgets/custom_appbar.dart';
import '../main_menu.dart';
import '../popup_menu_items.dart';
class ServiceContractsScreen extends StatelessWidget {
  const ServiceContractsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(
          text: 'Service Contracts',
        icon:IconButton(
          onPressed:()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const MainMenuFields())),
          icon:const Icon(Icons.arrow_back_ios_new_outlined,color: appBarColor,size: 20.0,),),

        action: [
        PopupMenuButton(itemBuilder: (BuildContext context){
          return PopupMenuItems.activityItems.map((String activityItems){
            return PopupMenuItem(
              height: MediaQuery.of(context).size.height*0.070,
              child:Text(activityItems),
            );
          }).toList();
        },
          icon:const Icon(Icons.more_vert,color: appBarColor,),
        ),
    ],
      ),
      body:const Center(
        child: Text('Service Contracts'),
      ),
    );
  }
}
