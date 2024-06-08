import 'package:flutter/material.dart';
import 'package:my_sap_app/model/bill_to_model.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/read_all_billto_address.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/Billto_adress_fields.dart';

import '../../../../../constants.dart';
import '../../../../../model/ship_to_model.dart';
import '../../../../../widgets/custom_appbar.dart';
import 'all_bill_to_addresses.dart';
import 'all_ship_to_address.dart';
import 'country_picker.dart';
import 'country_picker.dart';

class ViewShipToInfo extends StatefulWidget {
  const ViewShipToInfo({super.key, required this.shipAdd,});

  final ShipAdd shipAdd;

  @override
  State<ViewShipToInfo> createState() => _ViewShipInfoState();
}

class _ViewShipInfoState extends State<ViewShipToInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: 'ShipTo Address Info',
        icon: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: appBarColor,
              size: 20.0,
            ),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AllShipToAddress()))),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Card(
              shape: const Border.symmetric(),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ShipName',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Text(widget.shipAdd?.name ?? " "),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Card(
              shape: const Border.symmetric(),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Country',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Text(widget.shipAdd?.country ?? " "),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Card(
              shape: const Border.symmetric(),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'State',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Text(widget.shipAdd?.state ?? " "),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Card(
              shape: const Border.symmetric(),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'City',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: defaultPadding / 2,
                      ),
                      Text(widget.shipAdd?.city ?? ""),
                    ]),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Card(
              shape: const Border.symmetric(),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Street',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: defaultPadding / 2,
                      ),
                      Text(widget.shipAdd.street ?? " "),
                    ]),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Card(
              shape: const Border.symmetric(),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Postal Code',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: defaultPadding / 2,
                      ),
                      Text(widget.shipAdd.postalCode ?? " "),
                    ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
