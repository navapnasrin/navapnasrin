import 'package:flutter/material.dart';
import 'package:my_sap_app/db_helper/repository.dart';
import 'package:my_sap_app/model/contact_model.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/view_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/view_bp.dart';
import 'package:my_sap_app/services/bp_service.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';

import '../../../../../constants.dart';
import '../custom_form_bp.dart';
import '../custom_form_bp.dart';
import '../custom_form_bp.dart';
import '../custom_form_bp.dart';
import '../../../../../model/bp_model.dart';
import 'all_contact_view_screen.dart';

class ViewContact extends StatefulWidget {
  const ViewContact({super.key, required this.bp, });

  final ContactInfo bp;
//  final String? bn;



  @override
  State<ViewContact> createState() => _ViewContactState();
}

final _bpService=BpService();
//final name=_bpService.readNameById(bp)
//final contact=ContactInfo();

final repos = Repository();

final List<Bp> bpNameList = <Bp>[];
 String bpn="";
//int id=0''

class _ViewContactState extends State<ViewContact> {



  //final bpn=_bpService.readNameById();

  /*readBpNameById() async {
    var bpInfo = await _bpService.readAllBp();
    bpInfo.forEach((bpMap) {
      setState(() {
        var bpModel = Bp();
        bpModel.id = bpMap["id"];
        try {
          id = bpModel.id!;
        }
        on Exception catch (_, e){
          id=0;
        }
        bpModel.code = bpMap["code"];

        bpModel.name = bpMap["name"];
        bpModel.telephone = bpMap["telephone"];
        bpModel.email = bpMap["email"];
        bpModel.webSite = bpMap["webSite"];
        bpModel.bpType = bpMap["bpType"];
        bpModel.salesEmployee = bpMap["salesEmployee"];
        bpModel.priceList = bpMap
        ["priceList"];
        bpl.add(bpModel);

      });
    });
  }*/
  readName() async {
    var bpService = BpService();
 //bpn="";
    var bpInfo = await bpService.readAllBp();
    bpInfo.forEach((bpMap) {
      var bpModel = Bp();
      bpModel.id = bpMap["id"];

      try {
        if (bpModel.id == widget.bp.bpId) {
          bpn = bpMap["name"];
        }
      }
      on Exception catch (_, e) {}
    });
    print('bpn is $bpn');

  }




@override
  void initState(){
    super.initState();
    readName();

  }

  final ContactInfo cnt =ContactInfo();
//late String bpName="";

//final rep=Repository();



  @override
  Widget build(BuildContext context) {
// readName();
     //dynamic nm=_bpService.readNameById(cnt.bpId) ;
    // print(bp.==null);

    return Scaffold(
      appBar: CustomAppbar(
        text: 'Contact Info',
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
                        builder: (context) => const BpCustomerView()))
        ),),

      body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
              children: [
          SizedBox(
          width:MediaQuery.of(context).size.width,
          height: MediaQuery
              .of(context)
              .size
              .height * 0.18,

          child: Column(
            children: [
              Text(widget.bp.contactName??"",
                style: const TextStyle(fontSize: 35.0,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(widget.bp.contactPosition ?? " ",
                style: const TextStyle(color: kPrimaryColor,
                    fontSize: 20.0),
              ),
            ],
          )
      ),
      SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.65,

        child: SingleChildScrollView(
          child: Column(
              children: [
          SizedBox(
          width:MediaQuery.of(context).size.width,
          height: MediaQuery
              .of(context)
              .size
              .height * 0.10,
          
          child: Card(
            shape: const Border.symmetric(),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Mobile',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold
                    ),),
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                  Text(widget.bp.contactMobile ?? " "),
                ],
              ),
            ),
          ),
                ),
          
                const SizedBox(
          height: defaultPadding / 2),
          
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.10,
          
                  child: Card(
                    shape: const Border.symmetric(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Telephone1',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold
                            ),),
                          const SizedBox(
                            height: defaultPadding / 2,
                          ),
                          Text(widget.bp.contactTelephone1 ?? " "),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                    height: defaultPadding / 2),
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.10,
          
                  child: Card(
                    shape: const Border.symmetric(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Telephone2',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold
                            ),),
                          const SizedBox(
                            height: defaultPadding / 2,
                          ),
                          Text(widget.bp.contactTelephone2 ?? " "),
                        ],
                      ),
                    ),
                  ),
                ),
          
                const SizedBox(
                    height: defaultPadding / 2),
          
          
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.10,
          
                  child: Card(
                    shape: const Border.symmetric(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Fax',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold
                            ),),
                          const SizedBox(
                            height: defaultPadding / 2,
                          ),
                          Text(widget.bp.contactFax ?? " "),
                        ],
                      ),
                    ),
                  ),
                ),
          
                const SizedBox(
                    height: defaultPadding / 2),
          
          
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.10,
          
                  child: Card(
                    shape: const Border.symmetric(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('E-mail',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold
                            ),),
                          const SizedBox(
                            height: defaultPadding / 2,
                          ),
                          Text(widget.bp.contactEmail ?? " "),
                        ],
                      ),
                    ),
                  ),
                ),
          
                const SizedBox(
                    height: defaultPadding / 2),
          
          
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.10,
          
                  child:    Card(
                    shape: Border.symmetric(),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('BP',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold
                            ),),
                          SizedBox(
                            height: defaultPadding / 2,
                          ),


                          Text(bpn)

                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                    height: defaultPadding / 2),


                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.10,

                  child:   Card(
                    shape: const Border.symmetric(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('BpId',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold
                            ),),
                          const SizedBox(
                            height: defaultPadding / 2,
                          ),
                          Text('${widget.bp.bpId}'),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
                ),
        ),
    )

    ],
    )
    ,

    )
    ,

    );
  }
}
