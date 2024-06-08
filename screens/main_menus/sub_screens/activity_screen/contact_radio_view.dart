import 'package:flutter/material.dart';
import 'package:my_sap_app/constants.dart';
import 'package:my_sap_app/model/contact_model.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/add_activities_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/all_business_partners_view.dart';
import 'package:my_sap_app/services/contact_service.dart';
import 'package:my_sap_app/widgets/radio_button/custom_radio_btn.dart';

import '../../../../model/bp_model.dart';
import '../Business_Partners/bp_contact/view_bp.dart';

class ContactRadioList extends StatefulWidget {
  const ContactRadioList({super.key, this.contact, this.bp});

  final ContactInfo? contact;
  final Bp? bp;

  @override
  State<ContactRadioList> createState() => _ContactRadioListState();
}
dynamic? selectedCnt="";
String cnt="";

class _ContactRadioListState extends State<ContactRadioList> {
  late List<ContactInfo> contactRadioList=<ContactInfo>[];
  final bpContactService=BpContactService();

  final contact = ContactInfo();
  final bp=Bp();


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
        contactRadioList.add(contactModel);

      });
    });
  }


  readContactName() async {
    var contactService = BpContactService();
    //bpn="";
    var bpInfo = await contactService.readAllBp();
    bpInfo.forEach((bpMap) {
      setState(() {
        var contactModel = ContactInfo();

        try {
          if (contactModel.bpId == widget.bp?.id) {
            contactModel.contactId = bpMap["contactId"];
            contactModel.contactName = bpMap["contactName"];
            contactModel.contactTitle = bpMap["contactTitle"];
            contactModel.contactPosition = bpMap["contactPosition"];
            contactModel.contactMobile = bpMap["contactMobile"];
            contactModel.contactTelephone1 = bpMap["contactTelephone1"];
            contactModel.contactTelephone2 = bpMap["contactTelephone2"];
            contactModel.contactEmail = bpMap["contactEmail"];
            contactModel.contactFax = bpMap["contactFax"];
            contactModel.bpId = bpMap["bpId"];
            contactRadioList.add(contactModel);
          }
        }
        on Exception catch (_, e) {}
      });
    });
    print('bpn is $cnt');

  }

  getContactInfoById() async {

    var bpContactInfo = await bpContactService.readContactInfoByID(bpnId);
    bpContactInfo.forEach((bpMap) {
      setState(() {
        var contactModel = ContactInfo();
         contactModel.bpId=bpMap["bpId"];
         contactModel.contactId = bpMap["contactId"];
          contactModel.contactName = bpMap["contactName"];
          contactModel.contactTitle = bpMap["contactTitle"];
          contactModel.contactPosition = bpMap["contactPosition"];
          contactModel.contactMobile = bpMap["contactMobile"];
          contactModel.contactTelephone1 = bpMap["contactTelephone1"];
          contactModel.contactTelephone2 = bpMap["contactTelephone2"];
          contactModel.contactEmail = bpMap["contactEmail"];
          contactModel.contactFax = bpMap["contactFax"];
          contactRadioList.add(contactModel);
      });

    });
    print('bp id is:$bpnId');
  }



  @override
  void initState() {
    super.initState();
    //getAllContactInfo();
    getContactInfoById();
    print("bp id is ${widget.contact?.bpId}");

    //readContactName();

  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: contactRadioList.length,

            itemBuilder: (context, index) {
            return Card(
              color: Colors.indigo[100],
            child:RadioListTile(
              activeColor: kPrimaryColor,
              title: Text('${contactRadioList[index].contactName}'),
              value: contactRadioList[index].contactName ,
              groupValue: selectedCnt,
              onChanged: (value) {
                setState(() {
                  selectedCnt=value.toString();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddActivities()));
                });
              },)
            );
            }),
        ),
      ),
    );
  }
}
