import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/activities_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/deliveries_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/price_list_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/sales_opportunities_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/sales_orders_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/sales_quotations_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/service_calls_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/service_contracts_screen.dart';

import '../../../../constants.dart';

class BpTransaction extends StatefulWidget {
  const BpTransaction({super.key});

  @override
  State<BpTransaction> createState() => _BpTransactionState();
}

class _BpTransactionState extends State<BpTransaction> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                            builder: (context) => const Activities()));
                  },
                  title:const Text(
                    "Activities",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize:15.0,
                        color:kPrimaryColor
                    ),
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: defaultPadding/2,),
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
                            builder: (context) => const PriceListScreen()));
                  },
                  title:const Text(
                    "Special Prices",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize:15.0,
                        color:kPrimaryColor
                    ),
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: defaultPadding/2,),
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
                            builder: (context) => const SalesOpportunitiesScreen()));
                  },
                  title:const Text(
                    "Opportunities",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize:15.0,
                        color:kPrimaryColor
                    ),
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: defaultPadding/2,),
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
                            builder: (context) => const SalesQuotationScreen()));
                  },
                  title:const Text(
                    "Sales Quotations",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize:15.0,
                        color:kPrimaryColor
                    ),
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: defaultPadding/2,),
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
                            builder: (context) => const SalesOrdersScreen()));
                  },
                  title:const Text(
                    "Sales Orders",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize:15.0,
                        color:kPrimaryColor
                    ),
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: defaultPadding/2,),
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
                            builder: (context) => const DeliveriesScreen()));
                  },
                  title:const Text(
                    "Deliveries",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize:15.0,
                        color:kPrimaryColor
                    ),
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: defaultPadding,),
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
                            builder: (context) => const ServiceContractsScreen()));
                  },
                  title:const Text(
                    "Service Contract",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize:15.0,
                        color:kPrimaryColor
                    ),
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: defaultPadding/2,),
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
                            builder: (context) => const ServiceCallsScreen()));
                  },
                  title:const Text(
                    "Service Call",
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
      ),
    );
  }
}
