import 'dart:async';

import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:my_sap_app/constants.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact_fields.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';

import '../add_bp.dart';
import 'contact_list.dart';

class BpContact extends StatefulWidget {
  const BpContact({super.key,});


  @override
  State<BpContact> createState() => _BpContactState();
}

class _BpContactState extends State<BpContact> {



  @override
  Widget build(BuildContext context) {

setState(() {
  bpContactNameController.text = name??" ";
  bpContactMobileController.text = number??" ";
print(name);

});


    return  Scaffold(
      appBar: CustomAppbar(
        text:'BP Contact',
        icon: IconButton(
          onPressed:()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const AddBp()))
        .then((value){
          setState(() {
            bpContactNameController.text="";
            bpContactMobileController.text="";
          });
          }),
          icon:const Icon(Icons.arrow_back_ios_new_outlined,color: appBarColor,size: 20.0,),),


      ),

                      body: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ListView(
                          children: const [
                            Column(
                              children: [
                                BpContactFields()
                              ],
                            )
                          ],
                        ),
                      ),
    );
  }
}

                      /*CustomBp(title: "Name",
                        icon: Icons.arrow_forward_ios_outlined,
                        onPress: (){
                          showDialog(context: context,
                            builder: (context)=> CustomDialogWidget(
                              text:"Name",
                              actions: [
                                DialogTextField(
                                    controller:bpContactNameController,
                                  hintText: 'Required',
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CancelBtn(
                                        title:'Cancel',
                                        onPress: (){
                                          Navigator.of(context).pop();
                                        }),
                                    OkBtn(title:"ok",
                                        onPress: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const BpContact()));
                                        }),
                                  ],
                                )
                              ],
                                width: MediaQuery.of(context).size.width*0.5,
                                height:MediaQuery.of(context).size.height*0.80 ),
                          );
                        },

                      ),
                      CustomBp(title: "Position",
                        icon: Icons.arrow_forward_ios_outlined,
                        onPress: (){
                          showDialog(context: context,
                            builder: (context)=> CustomDialogWidget(
                              text:"Position",
                              actions: [
                                DialogTextField(controller:bpContactPositionController),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CancelBtn(
                                        title:'Cancel',
                                        onPress: (){
                                          Navigator.of(context).pop();
                                        }),
                                    OkBtn(title:"ok",
                                        onPress: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const BpContact()));
                                        }),
                                  ],
                                )
                              ],
                                width: MediaQuery.of(context).size.width*0.5,
                                height:MediaQuery.of(context).size.height*0.80 ),
                          );
                        },

                      ),
                      CustomBp(title: "Mobile",
                        icon: Icons.arrow_forward_ios_outlined,
                        onPress: (){
                          showDialog(context: context,
                            builder: (context)=> CustomDialogWidget(
                              text:"Mobile",
                              actions: [
                                DialogTextField(controller:bpContactMobileController),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CancelBtn(
                                        title:'Cancel',
                                        onPress: (){
                                          Navigator.of(context).pop();
                                        }),
                                    OkBtn(title:"ok",
                                        onPress: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const BpContact()));
                                        }),
                                  ],
                                )
                              ],
                                width: MediaQuery.of(context).size.width*0.5,
                                height:MediaQuery.of(context).size.height*0.80 ),
                          );
                        },

                      ),
                      CustomBp(title: "Telephone1",
                        icon: Icons.arrow_forward_ios_outlined,
                        onPress: (){
                          showDialog(context: context,
                            builder: (context)=> CustomDialogWidget(
                              text:"Telephone1",
                              actions: [
                                DialogTextField(controller:bpContactTelephone1Controller),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CancelBtn(
                                        title:'Cancel',
                                        onPress: (){
                                          Navigator.of(context).pop();
                                        }),
                                    OkBtn(title:"ok",
                                        onPress: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const BpContact()));
                                        }),
                                  ],
                                )
                              ],
                                width: MediaQuery.of(context).size.width*0.5,
                                height:MediaQuery.of(context).size.height*0.80 ),
                          );
                        },

                      ),
                      CustomBp(title: "Telephone2",
                        icon: Icons.arrow_forward_ios_outlined,
                        onPress: (){
                          showDialog(context: context,
                            builder: (context)=> CustomDialogWidget(
                              text:"Telephone2",
                              actions: [
                                DialogTextField(controller:bpContactTelephone2Controller),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CancelBtn(
                                        title:'Cancel',
                                        onPress: (){
                                          Navigator.of(context).pop();
                                        }),
                                    OkBtn(title:"ok",
                                        onPress: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const BpContact()));
                                        }),
                                  ],
                                )
                              ],
                                width: MediaQuery.of(context).size.width*0.5,
                                height:MediaQuery.of(context).size.height*0.80 ),
                          );
                        },

                      ),
                      CustomBp(title: "Email",
                        icon: Icons.arrow_forward_ios_outlined,
                        onPress: (){
                          showDialog(context: context,
                            builder: (context)=> CustomDialogWidget(
                              text:"Email",
                              actions: [
                                DialogTextField(controller:bpContactEmailController),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CancelBtn(
                                        title:'Cancel',
                                        onPress: (){
                                          Navigator.of(context).pop();
                                        }),
                                    OkBtn(title:"ok",
                                        onPress: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const BpContact()));
                                        }),
                                  ],
                                )
                              ],
                                width: MediaQuery.of(context).size.width*0.5,
                                height:MediaQuery.of(context).size.height*0.80 ),
                          );
                        },

                      ),
                      CustomBp(title: "Fax",
                        icon: Icons.arrow_forward_ios_outlined,
                        onPress: (){
                          showDialog(context: context,
                            builder: (context)=> CustomDialogWidget(
                              text:"Fax",
                              actions: [
                                DialogTextField(controller:bpContactFaxController),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CancelBtn(
                                        title:'Cancel',
                                        onPress: (){
                                          Navigator.of(context).pop();
                                        }),
                                    OkBtn(title:"ok",
                                        onPress: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const BpContact()));
                                        }),
                                  ],
                                )
                              ],
                                width: MediaQuery.of(context).size.width*0.5,
                                height:MediaQuery.of(context).size.height*0.80 ),
                          );
                        },

                      ),
                      const SizedBox(height: 30.0,),
                      CustomMoreField(
                          title: "More",
                          onPress: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const MoreScreen()));
                      }
                      ),*/


