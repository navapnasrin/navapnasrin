import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../widgets/custom_appbar.dart';
import '../Business_Partners/add_bp.dart';
import 'add_activities_screen.dart';

class ActivityMoreScreen extends StatelessWidget {
  const ActivityMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(
        text: "More",
        icon:IconButton(
          onPressed:()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const AddActivities())),
          icon:const Icon(Icons.arrow_back_ios_new_outlined,color: appBarColor,size: 20.0,),),


      ),
      body: const Center(
          child: Text('No Data')
      ),
    );
  }
}
