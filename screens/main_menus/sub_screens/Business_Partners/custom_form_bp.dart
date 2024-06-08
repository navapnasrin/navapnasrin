import 'package:flutter/material.dart';
import 'package:my_sap_app/constants.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/add_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/business_partners_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/custom_bpButton.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/ship_to_address.dart';
import 'package:my_sap_app/widgets/custom_submit_button.dart';
import 'package:my_sap_app/widgets/custom_text_form.dart';
import 'package:my_sap_app/widgets/drop_down_widget/bptyp_drop_down.dart';
import 'package:my_sap_app/widgets/drop_down_widget/emloyee_drop_down.dart';
import 'package:my_sap_app/widgets/drop_down_widget/pricelist_drop_down.dart';
import '../../../../model/bp_model.dart';
import '../../../../services/bp_service.dart';
import '../../../../widgets/dialog_screen/custom_dialog_widget.dart';
import 'bp_address/bill_to_adress.dart';
import 'bp_contact/bp_contact.dart';
import 'bp_contact/contact_list.dart';

class CustomFormBp extends StatefulWidget {
  const CustomFormBp({super.key,});


  @override
  State<CustomFormBp> createState() => _CustomFormBpState();
}

TextEditingController bpCodeController = TextEditingController();
TextEditingController bpNameController = TextEditingController();
TextEditingController bpTelephoneController = TextEditingController();
TextEditingController bpEmailController = TextEditingController();
TextEditingController bpWebSiteController = TextEditingController();

final _bpService=BpService();

//var id = customer

class _CustomFormBpState extends State<CustomFormBp> {


    @override
  Widget build(BuildContext context) {

    //print(bpl[0].id);
    return SizedBox(
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
                                      text: 'Add Phone Book', onTap: () {

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const ContactList()));

                                          /*bool permission = await FlutterContactPicker.requestPermission();
                                          if(permission){
                                            if(await FlutterContactPicker.hasPermission()){
                                              _phoneContact=await FlutterContactPicker.pickPhoneContact();
                                              if(_phoneContact!=null){
                                                if(_phoneContact!.fullName!.isNotEmpty){
                                                  setState(() {
                                                    contactName=_phoneContact!.fullName!.toString();
                                                  });
                                                }
                                                if(_phoneContact!.phoneNumber!.number!.isNotEmpty){
                                                  setState(() {
                                                    contactNumber=_phoneContact!.phoneNumber!.number!.toString();

                                                  });
                                                }


                                              }
                                            }
                                          }*/
                                  })
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
                CustomSubmitButton(text: "Submit", onTap: () async{
                  final bp=Bp();
                  bp.code=bpCodeController.text;
                  bp.name=bpNameController.text;
                  bp.telephone=bpTelephoneController.text;
                  bp.email=bpEmailController.text;
                  bp.webSite=bpWebSiteController.text;
                  bp.bpType=selectBpTyp;
                  bp.salesEmployee=selectEmployee;
                  bp.priceList=selectPrice;

                  var result = await _bpService.saveBp(bp);
                 Navigator.push(context, MaterialPageRoute(builder: (result)=>const BusinessPartnersScreen()));

                  print(result);
                  setState(() {
                    bpCodeController.text="";
                    bpNameController.text="";
                    bpTelephoneController.text="";
                    bpEmailController.text="";
                    bpWebSiteController.text="";
                  });


                },
                )
              ]),
            ],
          ),
        )));
  }
}
