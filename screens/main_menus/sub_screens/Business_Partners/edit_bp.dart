import 'package:flutter/material.dart';
import 'package:my_sap_app/model/contact_model.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/business_partners_screen.dart';
import '../../../../constants.dart';
import 'bp_address/bill_to_adress.dart';
import 'bp_contact/bp_contact.dart';
import 'custom_bpButton.dart';
import 'custom_form_bp.dart';
import 'bp_address/ship_to_address.dart';
import '../../../../services/bp_service.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_submit_button.dart';
import '../../../../widgets/custom_text_form.dart';
import '../../../../widgets/dialog_screen/custom_dialog_widget.dart';
import '../../../../widgets/drop_down_widget/bptyp_drop_down.dart';
import '../../../../widgets/drop_down_widget/emloyee_drop_down.dart';
import '../../../../widgets/drop_down_widget/pricelist_drop_down.dart';
import 'bp_contact/view_bp.dart';

import '../../../../model/bp_model.dart';

class EditBpInfo extends StatefulWidget {
  const EditBpInfo({super.key, required this.bp, this.contact});

  final Bp bp;
  final ContactInfo? contact;

  @override
  State<EditBpInfo> createState() => _EditBpInfoState();
}



class _EditBpInfoState extends State<EditBpInfo> {

  TextEditingController bpCodeController = TextEditingController();
  TextEditingController bpNameController = TextEditingController();
  TextEditingController bpTelephoneController = TextEditingController();
  TextEditingController bpEmailController = TextEditingController();
  TextEditingController bpWebSiteController = TextEditingController();

  final bpService= BpService();

  @override
  void initState() {
    setState(() {
      bpNameController.text=widget.bp.name??"";
      bpCodeController.text=widget.bp.code??"";
      bpTelephoneController.text=widget.bp.telephone??" ";
      bpWebSiteController.text=widget.bp.webSite??" ";
      bpEmailController.text=widget.bp.email??" ";
      selectPrice=widget.bp.priceList;
      selectEmployee=widget.bp.salesEmployee;
      selectBpTyp=widget.bp.bpType;
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(
        text: "Edit BP",
        icon: IconButton(
          onPressed:()=>Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const BpCustomerView())),
          icon:const Icon(Icons.arrow_back_ios_new_outlined,color: appBarColor,size: 20.0,),),

        //svg:SvgPicture.asset('assets/images/business_partners.svg',
        // color: appBarColor,),

      ),
      body:
          ListView(
            children:[ Column(
              children: [
                SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height,
                child: Form(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ListView(
                        children: [
                          Column(children: [
                            CustomTextFormField(
                              isObscure: false,
                              label: "BP Code",
                              controller: bpCodeController,
                            ),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            CustomTextFormField(
                              isObscure: false,
                              label: "BP Name",
                              controller: bpNameController,
                            ),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            CustomTextFormField(
                              isObscure: false,
                              label: "Telephone ",
                              controller: bpTelephoneController,
                            ),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            CustomTextFormField(
                              isObscure: false,
                              label: "E-Mail ",
                              controller: bpEmailController,
                            ),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            CustomTextFormField(
                              isObscure: false,
                              label: "Web Site ",
                              controller: bpWebSiteController,
                            ),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            const BpTypDropDown(),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            const EmployeeDropDown(),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            const PriceListDropDown(),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            CustomBpButton(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => CustomDialogWidget(
                                        text: 'Add Contact',
                                        actions: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              CustomBpButton(
                                                  text: "New Contact",
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                            const BpContact()));
                                                  }),
                                              const SizedBox(
                                                height: 15.0,
                                              ),
                                              CustomBpButton(
                                                  text: 'Add Phone Book', onTap: () {})
                                            ],
                                          )
                                        ],
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        height: MediaQuery.of(context).size.height * 0.80),
                                  );
                                },
                                text: "Main Contact"),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            CustomBpButton(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => CustomDialogWidget(
                                        text: 'New Address',
                                        actions: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              CustomBpButton(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                          const BillToAddress()));
                                                },
                                                text: 'New Address',
                                              )
                                            ],
                                          )
                                        ],
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        height: MediaQuery.of(context).size.height * 0.80),
                                  );
                                },
                                text: "Bill To"),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            CustomBpButton(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => CustomDialogWidget(
                                        text: 'Add Address',
                                        actions: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              CustomBpButton(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                          const ShipToAddress()));
                                                },
                                                text: 'New Address',
                                              )
                                            ],
                                          )
                                        ],
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        height: MediaQuery.of(context).size.height * 0.80),
                                  );
                                },
                                text: "Ship To"),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            CustomSubmitButton(text: "Update", onTap: () async{
                              final bp=Bp();
                              bp.id=widget.bp.id;
                              bp.code=bpCodeController.text;
                              bp.name=bpNameController.text;
                              bp.telephone=bpTelephoneController.text;
                              bp.email=bpEmailController.text;
                              bp.webSite=bpWebSiteController.text;
                              bp.bpType=selectBpTyp;
                              bp.salesEmployee=selectEmployee;
                              bp.priceList=selectPrice;


                              var result = await bpService.updateBp(bp);
                              Navigator.pop(context,result);


                            },
                            )
                          ]),
                        ],
                      ),
                    )
                    ),
                ),
              ],
            ),
    ]
          ),
    );

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


  }
}
