import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/read_all_contact.dart';

import '../../../../../constants.dart';
import '../../../../../model/bp_model.dart';
import '../../../../../model/contact_model.dart';
import '../../../../../services/contact_service.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../../../../../widgets/custom_submit_button.dart';
import '../../../../../widgets/custom_text_form.dart';
import '../bp_contact_fields.dart';
import 'all_contact_view_screen.dart';

class UpdateContactScreen extends StatefulWidget {
  const UpdateContactScreen({super.key, required this.contact});

  final ContactInfo contact;

  @override
  State<UpdateContactScreen> createState() => _UpdateContactScreenState();
}

class _UpdateContactScreenState extends State<UpdateContactScreen> {


  TextEditingController bpContactNameController = TextEditingController();
  TextEditingController bpContactPositionController = TextEditingController();
  TextEditingController bpContactTelephone1Controller = TextEditingController();
  TextEditingController bpContactTelephone2Controller = TextEditingController();
  TextEditingController bpContactEmailController = TextEditingController();
  TextEditingController bpContactTitleController = TextEditingController();
  TextEditingController bpContactMobileController = TextEditingController();
  TextEditingController bpContactFaxController = TextEditingController();

  final _bpContactService = BpContactService();

  @override
  void initState(){
    setState(() {
      bpContactNameController.text=widget.contact.contactName??"";
      bpContactTitleController.text=widget.contact.contactTitle??"";
      bpContactPositionController.text=widget.contact.contactPosition??"";
      bpContactMobileController.text=widget.contact.contactMobile??"";
      bpContactTelephone1Controller.text=widget.contact.contactTelephone1??"";
      bpContactTelephone2Controller.text=widget.contact.contactTelephone2??"";
      bpContactEmailController.text=widget.contact.contactEmail??"";
      bpContactFaxController.text=widget.contact.contactFax??"";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
        text: 'Update Contact',
        icon: IconButton(
        icon: const Icon(
        Icons.arrow_back_ios_new_outlined,
        color: appBarColor,
        size: 20.0,
    ),
    onPressed: () =>
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const ReadAllContact()))
    ),),

      body:  Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView(
          children: [
            Column(
              children: [
            SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height,
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: ListView(
                children: [
                  Column(
                    children: [
                      CustomTextFormField(
                        isObscure: false,
                        label: "Name",
                        controller: bpContactNameController,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      CustomTextFormField(
                        isObscure: false,
                        label: "Title",
                        controller: bpContactTitleController,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      CustomTextFormField(
                        isObscure: false,
                        label: "Position",
                        controller: bpContactPositionController,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      CustomTextFormField(
                        isObscure: false,
                        label: "Mobile",
                        controller: bpContactMobileController,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      CustomTextFormField(
                        isObscure: false,
                        label: "Telephone1",
                        controller: bpContactTelephone1Controller,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      CustomTextFormField(
                        isObscure: false,
                        label: "Telephone2",
                        controller: bpContactTelephone2Controller,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      CustomTextFormField(
                        isObscure: false,
                        label: "E-mail",
                        controller: bpContactEmailController,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      CustomTextFormField(
                        isObscure: false,
                        label: "Fax",
                        controller: bpContactFaxController,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      CustomSubmitButton(text: "Update", onTap: () async{
                        final contact=ContactInfo();
                        final bp=Bp();
                        //contact.bpId=id;
                        contact.bpId=widget.contact.bpId;
                        contact.contactId=widget.contact.contactId;
                        contact.contactName=bpContactNameController.text;
                        contact.contactTitle=bpContactTitleController.text;
                        contact.contactPosition=bpContactPositionController.text;
                        contact.contactMobile=bpContactMobileController.text;
                        contact.contactTelephone1=bpContactTelephone1Controller.text;
                        contact.contactTelephone2=bpContactTelephone2Controller.text;
                        contact.contactEmail=bpContactEmailController.text;
                        contact.contactFax=bpContactFaxController.text;



                        var result = await _bpContactService.updateBp(contact);
                        Navigator.push(context, MaterialPageRoute(builder: (result)=>ReadAllContact()));
                        //print(result);
                        setState(() {
                          bpContactNameController.text=" ";
                          bpContactMobileController.text=" ";
                          bpContactTitleController.text=" ";
                          bpContactFaxController.text=" ";
                          bpContactEmailController.text=" ";
                          bpContactPositionController.text=" ";
                          bpContactTelephone1Controller.text=" ";
                          bpContactTelephone2Controller.text=" ";



                        });
                      })
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
              ],
            )
          ],
        ),
      ),
    );
  }
}
