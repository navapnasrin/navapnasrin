

import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/business_partners_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/custom_form_bp.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';
import '../../../../constants.dart';

class AddBp extends StatefulWidget {
  const AddBp({super.key,});

  @override
  State<AddBp> createState() => _AddBpState();
}
class _AddBpState extends State<AddBp> {




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(
          text: "Add BP",
          icon: IconButton(
        onPressed:()=>Navigator.push(context,
        MaterialPageRoute(builder: (context)=>BusinessPartnersScreen())),
        icon:const Icon(Icons.arrow_back_ios_new_outlined,color: appBarColor,size: 20.0,),),

        //svg:SvgPicture.asset('assets/images/business_partners.svg',
         // color: appBarColor,),

      ),
      body: ListView(
        children: const [

         Column(
          children: [
            CustomFormBp(),

      /*CustomBp(title: "BP Type",
        icon: Icons.arrow_forward_ios_outlined,
        onPress: (){
          showDialog(context: context,
            builder: (context)=>  CustomDialogWidget(
              text: 'BP Type',
              actions: [
                const RadioBtnBpTyp(),
                const SizedBox(height: 3.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CancelBtn(
                        title:'Cancel',
                        onPress: (){
                      Navigator.of(context).pop();
                    }),
                    OkBtn(title:"ok",
                        onPress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddBp()));
                    }),
                  ],
                )
              ],
                width: MediaQuery.of(context).size.width*0.5,
                height:MediaQuery.of(context).size.height*0.80
            )
          );
        },),

            CustomBp(title: "Main Contact",
                icon: Icons.arrow_forward_ios_outlined,
                onPress: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainContact()));
                }
                ),

            CustomBp(title: "Sales Employee",
              icon: Icons.arrow_forward_ios_outlined,
              onPress: (){
                showDialog(context: context,
                    builder: (context)=>  CustomDialogWidget(
                      text: 'Sales Employee',
                      actions: [
                        const SalesEmployeeRadioBtn(),
                        const SizedBox(height: 3.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CancelBtn(
                                title:'Cancel',
                                onPress: (){
                                  Navigator.of(context).pop();
                                }),
                            OkBtn(title:"ok",
                                onPress: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddBp()));
                                }),
                          ],
                        )
                      ],
                      width: MediaQuery.of(context).size.width*0.5,
                      height:MediaQuery.of(context).size.height*0.50 ,
                    )
                );
              },),

            const SizedBox(height: 32.0,),
            CustomBp(
                title: "Bill To",
                icon: Icons.arrow_forward_ios_outlined,
                onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const BillToScreen()));
                }
                ),
            const SizedBox(height: 3.0,),
            CustomBp(
                title: "Ship To",
                icon: Icons.arrow_forward_ios_outlined,
                onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShipToScreen()));
                }
            ),
            const SizedBox(height: 32.0,),

            CustomBp(title: "Price List",
              icon: Icons.arrow_forward_ios_outlined,
              onPress: (){
                showDialog(context: context,
                    builder: (context)=>  CustomDialogWidget(
                      text: 'Price List',
                      actions: [
                        const PriceListRadioBtn(),
                        const SizedBox(height: 3.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CancelBtn(
                                title:'Cancel',
                                onPress: (){
                                  Navigator.of(context).pop();
                                }),
                            OkBtn(title:"ok",
                                onPress: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddBp()));
                                }),
                          ],
                        )
                      ],
                      width: MediaQuery.of(context).size.width*0.7,
                      height:MediaQuery.of(context).size.height*0.50 ,
                    )
                );
              },),

            const SizedBox(height: 32.0,),




            const SizedBox(height: 32.0,),

            CustomMoreField(
                onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MoreScreen()));
                },
                title: "More")*/



        ],

      ),
    ],

    ),
    );
  }
}
