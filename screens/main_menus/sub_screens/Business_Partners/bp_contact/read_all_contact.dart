import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/view_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/all_contact_view_screen.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';

import '../../../../../constants.dart';

class ReadAllContact extends StatefulWidget {
  const ReadAllContact({super.key});

  @override
  State<ReadAllContact> createState() => _ReadAllContactState();
}

class _ReadAllContactState extends State<ReadAllContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: 'All Contacts',
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
                        builder: (context) => const BpCustomerView()))
        ),

      ),

      body: const AllContactViewScreen(),
    );
  }
}
