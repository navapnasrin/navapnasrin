import 'package:flutter/material.dart';
import 'package:my_sap_app/model/contact_model.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/update_contact_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/view_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/view_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/business_partners_screen.dart';

import '../../../../../constants.dart';
import '../../../../../model/bp_model.dart';
import '../../../../../services/bp_service.dart';
import '../edit_bp.dart';
import 'view_contact.dart';
import 'contact_list.dart';
import '../../../../../services/contact_service.dart';

class AllContactViewScreen extends StatefulWidget {
  const AllContactViewScreen({super.key});

  @override
  State<AllContactViewScreen> createState() => _AllContactViewScreenState();
}
//String bn="";

class _AllContactViewScreenState extends State<AllContactViewScreen> {

  late List<ContactInfo> bpContactList = <ContactInfo>[];
  final bpContactService= BpContactService();


  //final List<Bp> bpList =<Bp>[];
//String bn="";
  getAllBpInfo() async {
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
        contactModel.bpId=bpMap["bpId"];
        bpContactList.add(contactModel);

      });
    });
  }

  bpInfoById() async {
    var bpContactInfo = await bpContactService.readContactInfoByID(cBpId);
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
        contactModel.bpId=bpMap["bpId"];
        bpContactList.add(contactModel);

      });
    });
  }



  @override
  void initState() {
    super.initState();
    bpInfoById();

}
  //late Future<List?> readList;

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.90,
      child: ListView.builder(
      itemCount: bpContactList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: ()async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewContact(
                              bp:bpContactList[index],


                          ))).then((value) => {

                      //readList=repos.selectDataById("bpInfo", );
                  //List? l= await readList;
                 // print(l);


                });
                },
                title: Text(
                  bpContactList[index].contactName ?? ' ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: kPrimaryColor
                  ),
                ),
                subtitle: Text(bpContactList[index].contactPosition ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  UpdateContactScreen(
                                    contact: bpContactList[index],)));
                        },
                        icon: const Icon(Icons.edit,
                            size: 20.0, color: kPrimaryColor)),
                    IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(Icons.delete,
                            size: 20.0, color: Colors.red)),

                  ],
                ),
              ),
            );
          }),
    );
  }
}
