import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_sap_app/screens/main_menus/build_card.dart';

import '../../../../constants.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../main_menu.dart';
import '../../popup_menu_items.dart';
import 'dashboard_menu.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(
          text: 'Dashboard',
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
      body:SingleChildScrollView(
        child: Column(
          children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: DashboardMenu(
                      title:"Sales Analysis",
                  assetName:SvgPicture.asset('assets/icons/reports-icon.svg',
                            width:MediaQuery.of(context).size.width*0.04,
                            height:MediaQuery.of(context).size.height*0.04,
                            colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),
                      onPress: (){}
                  ),
                ),

            const SizedBox(
              height: defaultPadding/2,
            ),

            DashboardMenu(
                title:"Purchase Quotations",
                assetName:SvgPicture.asset('assets/icons/reports-icon.svg',
                  width:MediaQuery.of(context).size.width*0.04,
                  height:MediaQuery.of(context).size.height*0.04,
                  colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),
                onPress: (){}
            ),

            const SizedBox(
              height: defaultPadding/2,
            ),

            DashboardMenu(
                title:"Service Calls By Items for Last 6 Months",
                assetName:SvgPicture.asset('assets/icons/reports-icon.svg',
                  width:MediaQuery.of(context).size.width*0.04,
                  height:MediaQuery.of(context).size.height*0.04,
                  colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),
                onPress: (){}
            ),

            const SizedBox(
              height: defaultPadding/2,
            ),

            DashboardMenu(
                title:"Service Calls by Status",
                assetName:SvgPicture.asset('assets/icons/reports-icon.svg',
                  width:MediaQuery.of(context).size.width*0.04,
                  height:MediaQuery.of(context).size.height*0.04,
                  colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),
                onPress: (){}
            ),

            const SizedBox(
              height: defaultPadding/2,
            ),

            DashboardMenu(
                title:"Top 5 Business Partners by Sales",
                assetName:SvgPicture.asset('assets/icons/reports-icon.svg',
                  width:MediaQuery.of(context).size.width*0.04,
                  height:MediaQuery.of(context).size.height*0.04,
                  colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),
                onPress: (){}
            ),

            const SizedBox(
              height: defaultPadding/2,
            ),

            DashboardMenu(
                title:"Top 5 Vendors by A/P Invoice",
                assetName:SvgPicture.asset('assets/icons/reports-icon.svg',
                  width:MediaQuery.of(context).size.width*0.04,
                  height:MediaQuery.of(context).size.height*0.04,
                  colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),
                onPress: (){}
            ),

            const SizedBox(
              height: defaultPadding/2,
            ),

            DashboardMenu(
                title:"Top 5 Items by Sales Amount",
                assetName:SvgPicture.asset('assets/icons/reports-icon.svg',
                  width:MediaQuery.of(context).size.width*0.04,
                  height:MediaQuery.of(context).size.height*0.04,
                  colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),
                onPress: (){}
            ),

            const SizedBox(
              height: defaultPadding/2,
            ),

            DashboardMenu(
                title:"Aging of Receivables Overdue (10-days Interval )",
                assetName:SvgPicture.asset('assets/icons/reports-icon.svg',
                  width:MediaQuery.of(context).size.width*0.04,
                  height:MediaQuery.of(context).size.height*0.04,
                  colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),
                onPress: (){}
            ),

            const SizedBox(
              height: defaultPadding/2,
            ),

            DashboardMenu(
                title:"Aging of Payable Overdue (10-days Interval )",
                assetName:SvgPicture.asset('assets/icons/reports-icon.svg',
                  width:MediaQuery.of(context).size.width*0.04,
                  height:MediaQuery.of(context).size.height*0.04,
                  colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),
                onPress: (){}
            ),

            const SizedBox(
              height: defaultPadding/2,
            ),

            DashboardMenu(
                title:"Top 5 Customers by Receivable Overdue",
                assetName:SvgPicture.asset('assets/icons/reports-icon.svg',
                  width:MediaQuery.of(context).size.width*0.04,
                  height:MediaQuery.of(context).size.height*0.04,
                  colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),
                onPress: (){}
            ),

            const SizedBox(
              height: defaultPadding/2,
            ),

            DashboardMenu(
                title:"Top 5 Vendor by Payables Overdue",
                assetName:SvgPicture.asset('assets/icons/reports-icon.svg',
                  width:MediaQuery.of(context).size.width*0.04,
                  height:MediaQuery.of(context).size.height*0.04,
                  colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),
                onPress: (){}
            ),

            const SizedBox(
              height: defaultPadding/2,
            ),

            DashboardMenu(
                title:"Top 5 Best-Selling Items by Sales Amount",
                assetName:SvgPicture.asset('assets/icons/reports-icon.svg',
                  width:MediaQuery.of(context).size.width*0.04,
                  height:MediaQuery.of(context).size.height*0.04,
                  colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),),
                onPress: (){}
            ),
          ],
        ),
      ),
    );
  }
}
