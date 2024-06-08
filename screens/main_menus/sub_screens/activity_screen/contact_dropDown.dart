import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../model/contact_model.dart';
import '../../../../services/contact_service.dart';

class ContactDropDownView extends StatefulWidget {
  const ContactDropDownView({super.key});

  @override
  State<ContactDropDownView> createState() => _ContactDropDownViewState();
}

class _ContactDropDownViewState extends State<ContactDropDownView> {

  final List<ContactInfo> contactList=<ContactInfo>[];
  final bpContactService=BpContactService();
   String? selectContact="";


  getAllContactInfo() async {
    var bpContactInfo = await bpContactService.readAllBp();
    bpContactInfo.forEach((bpMap) {
      setState(() {
        var contactModel = ContactInfo();
        contactModel.contactId = bpMap["contactId"];
        contactModel.contactName = bpMap["contactName"];
        contactModel.contactTitle = bpMap["contactTitle"];
        contactModel.contactPosition = bpMap["contactPosition"];
        contactModel.contactMobile = bpMap["contactMobile"];
        contactModel.contactTelephone1 = bpMap["contactTelephone1"];
        contactModel.contactTelephone2 = bpMap["contactTelephone2"];
        contactModel.contactEmail = bpMap["contactEmail"];
        contactModel.contactFax = bpMap["contactFax"];
        contactList.add(contactModel);

      });
    });
  }


  @override
  void initState() {
    super.initState();
    getAllContactInfo();

  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height*0.13,
      
        child: DropdownButtonFormField(
          items:  contactList.map((e) => DropdownMenuItem(
            value: e,
            child: Text(e as String??" "),)).toList(),
          onChanged: (value) {
            setState(() {
              selectContact=value as String?;
            });
          },
          decoration: InputDecoration(
            labelText: "Contact",
            labelStyle: const TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold),
      
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.indigo),
                borderRadius: BorderRadius.circular(10.0)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color:kPrimaryColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      
      ),
    );
  }
}
