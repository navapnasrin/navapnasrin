import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/read_shipto_address.dart';

import '../../../../../constants.dart';
import '../../../../../widgets/custom_appbar.dart';
import 'all_addresses.dart';

class AllShipToAddress extends StatelessWidget {
  const AllShipToAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
        text: 'All Ship Addresses',
        icon: IconButton(
        icon: const Icon(
        Icons.arrow_back_ios_new_outlined,
        color: appBarColor,
        size: 20.0,
    ),
    onPressed: () => Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const AllAddresses()))),
    ),
      body: const ReadAllShipToAddress(),
    );

  }
}
