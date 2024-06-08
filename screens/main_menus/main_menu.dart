import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sap_app/constants.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/activities_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/alerts_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/approval_screen.dart';
import 'package:my_sap_app/screens/main_menus/build_card.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/business_partners_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/dashboard_page/dashboard_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/deliveries_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/inventory_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/price_list_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/reports_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/sales_opportunities_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/sales_orders_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/sales_quotations_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/service_calls_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/service_contracts_screen.dart';
import 'package:my_sap_app/widgets/appbar_widget.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';
class MainMenuFields extends StatelessWidget {

  const MainMenuFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        image: const AssetImage('assets/images/smart_logo.png'
       ),
        text: 'SAP Business One', btn: IconButton(
          onPressed: (){
          },
          icon: const Icon(Icons.more_vert_outlined,color: Colors.white70,size: 30.0,),
        ),),
      /*appBar: CustomAppbar(text: 'SAP Business One',
        icon: SvgPicture.asset('assets/images/SAP_lcon.svg',
            width:MediaQuery.of(context).size.width*0.04,
          height:MediaQuery.of(context).size.height*0.04
        ),),*/
          //icon: SvgPicture.asset('assets/images/calendar.svg',
            //color: appBarColor,)),

        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

            child: Container(
                color: appBarColor,
                    child: SingleChildScrollView(

                      child: Stack(
                        children:[ Column(
                        children:<Widget> [

                          BuildCard(title:"Activities",
                                        onPress: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=>const Activities()));
                          },
                            assetName:SvgPicture.asset('assets/images/calendar.svg',
                              width:MediaQuery.of(context).size.width*0.04,
                              height:MediaQuery.of(context).size.height*0.04,
                                colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),),

                          BuildCard(title:"Approvals",
                            onPress: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=>const ApprovalScreen()));
                                        },
                            assetName:SvgPicture.asset('assets/images/approval.svg',
                                width:MediaQuery.of(context).size.width*0.04,
                                height:MediaQuery.of(context).size.height*0.04,
                              colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),),

                          BuildCard(title:"Alerts",
                                        onPress: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=>const AlertScreen()));
                                        },
                            assetName:SvgPicture.asset('assets/images/alert.svg',
                                width:MediaQuery.of(context).size.width*0.04,
                                height:MediaQuery.of(context).size.height*0.04,

                                ),),

                          BuildCard(title:"Business Partners",

                            onPress: ()async{
                                          await Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=>
                                              const BusinessPartnersScreen()));
                                        },
                            assetName:SvgPicture.asset('assets/images/business_partners.svg',
                                width:MediaQuery.of(context).size.width*0.03,
                                height:MediaQuery.of(context).size.height*0.03,
                              colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),),


                          BuildCard(title:"Inventory",

                                        onPress: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=>const InventoryScreen()));
                                        },
                            assetName:SvgPicture.asset('assets/images/inventory.svg',
                                width:MediaQuery.of(context).size.width*0.04,
                                height:MediaQuery.of(context).size.height*0.04,
                              colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),),

                          BuildCard(title:"Price List",
                              onPress: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=>const PriceListScreen()));
                                        },
                            assetName:SvgPicture.asset('assets/images/price_list.svg',
                                width:MediaQuery.of(context).size.width*0.04,
                                height:MediaQuery.of(context).size.height*0.04,
                              colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),),


                          BuildCard(title:"Sales Opportunities",

                              onPress: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>const SalesOpportunitiesScreen()));
                              },
                            assetName:SvgPicture.asset('assets/images/sales_opportunities.svg',
                                width:MediaQuery.of(context).size.width*0.04,
                                height:MediaQuery.of(context).size.height*0.04,
                              colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),),

                          BuildCard(title:"Sales Quotations",

                              onPress: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>const SalesQuotationScreen()));
                              },
                            assetName:SvgPicture.asset('assets/images/sales_quotation.svg',
                                width:MediaQuery.of(context).size.width*0.04,
                                height:MediaQuery.of(context).size.height*0.04,
                              colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),),


                          BuildCard(title:"Sales Orders",

                              onPress: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>const SalesOrdersScreen()));
                              },
                            assetName:SvgPicture.asset('assets/images/order.svg',
                                width:MediaQuery.of(context).size.width*0.04,
                                height:MediaQuery.of(context).size.height*0.04,
                              colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),),

                          BuildCard(title:"Deliveries",

                              onPress: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const DeliveriesScreen()));
                              },
                            assetName:SvgPicture.asset('assets/images/delivery_icon.svg',
                                width:MediaQuery.of(context).size.width*0.04,
                                height:MediaQuery.of(context).size.height*0.04,
                              colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
                            ),),

                          BuildCard(title:"Service Contracts",

                              onPress: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>const ServiceContractsScreen()));
                              },
                            assetName:SvgPicture.asset('assets/images/service_contracts.svg',
                                width:MediaQuery.of(context).size.width*0.04,
                                height:MediaQuery.of(context).size.height*0.04,
                              colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),),

                          BuildCard(title:"Service Call",

                              onPress: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>const ServiceCallsScreen()));
                              },
                            assetName:SvgPicture.asset('assets/images/service_call.svg',
                                width:MediaQuery.of(context).size.width*0.04,
                                height:MediaQuery.of(context).size.height*0.04,
                              colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),),

                          BuildCard(title:"Reports",

                              onPress: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>const ReportsScreen()));
                              },
                            assetName:SvgPicture.asset('assets/images/report-icon.svg',
                                width:MediaQuery.of(context).size.width*0.04,
                                height:MediaQuery.of(context).size.height*0.04,
                              colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),),

                          BuildCard(title:"Dashboard",

                              onPress: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>const DashboardScreen()));
                              },

                            assetName:SvgPicture.asset('assets/images/dashboard_icon.svg',
                                width:MediaQuery.of(context).size.width*0.04,
                                height:MediaQuery.of(context).size.height*0.04,
                              colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),),


                          /*buildCard(Icon(Icons.bookmark_added),"Approvals"),
                        buildCard(Icon(Icons.add_alert),"Alerts"),
                        buildCard(Icon(Icons.people_outline_outlined),"Business Partners"),
                        buildCard(Icon(Icons.inventory),"Inventory"),
                        buildCard(Icon(Icons.price_change),"Price List"),
                        buildCard(Icon(Icons.sd_card_alert),"Sales Oppurtunities"),
                        buildCard(Icon(Icons.quora),"Sales Quotatios"),
                        buildCard(Icon(Icons.opacity_rounded),"Sales Orders"),
                        buildCard(Icon(Icons.delivery_dining),"Deliveries"),
                        buildCard(Icon(Icons.design_services),"Service Contact"),
                        buildCard(Icon(Icons.call),"Service Call"),
                        buildCard(Icon(Icons.report_gmailerrorred_rounded),"Reports"),
                        buildCard(Icon(Icons.dashboard),"Dashboard"),*/
                        ],

                                    ),
              ],
                      ),

                      ),
                    ),
        ),

    );
  }


  }


