import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/add_activity_feilds.dart';

import '../../../../constants.dart';
import '../../../../model/bp_model.dart';
import '../../../../widgets/custom_appbar.dart';
import 'activities_screen.dart';

class AddActivities extends StatelessWidget {
  const AddActivities({super.key,  this.bpModel});
  final Bp? bpModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: 'Add Activity',
        icon: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: appBarColor,
              size: 20.0,
            ),
            onPressed: () =>
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Activities()))
        ),),

      body: ListView(
        children: const [
          Column(
            children: [
              AddActivityFields()
            ],
          )
        ],
      ),
    );
  }
}
