import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/read_all_billto_address.dart';

import '../../../../../constants.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../bp_contact/view_bp.dart';
import 'all_bill_to_addresses.dart';
import 'all_ship_to_address.dart';

class AllAddresses extends StatefulWidget {
  const AllAddresses({super.key});

  @override
  State<AllAddresses> createState() => _AllAddressesState();
}

class _AllAddressesState extends State<AllAddresses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: 'All Addresses',
        icon: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: appBarColor,
              size: 20.0,
            ),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BpCustomerView()))),
      ),

      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.08,

            child:  Card(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: ListTile(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllBillToAddresses()));
                },
                title:const Text(
                  "BillTo Address",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize:15.0,
                      color:kPrimaryColor
                  ),
                ),
              ),
            ),
          ),


          const SizedBox(
            height: 10.0,
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.08,

            child:  Card(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: ListTile(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllShipToAddress()));
                },
                      title:const Text(
                        "shipTo Address",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize:15.0,
                            color:kPrimaryColor
                        ),
                      ),
                  ),
              ),
              ),

        ],
      ),
    );
  }
}
