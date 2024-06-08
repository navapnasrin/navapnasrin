import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/all_addresses.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/read_all_billto_address.dart';

import '../../../../../constants.dart';
import '../../../../../widgets/custom_appbar.dart';

class AllBillToAddresses extends StatefulWidget {
  const AllBillToAddresses({super.key});

  @override
  State<AllBillToAddresses> createState() => _AllBillToAddressesState();
}

class _AllBillToAddressesState extends State<AllBillToAddresses> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(
        text: 'All BillTo Addresses',
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

      body: const ReadAllBillToAddress(),


    );
  }
}
