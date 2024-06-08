import 'dart:math';

import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sap_app/model/bill_to_model.dart';
import 'package:my_sap_app/model/ship_to_model.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/read_all_contact.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/business_partners_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/custom_form_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/all_contact_view_screen.dart';
import 'package:my_sap_app/services/contact_service.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact_fields.dart';
import '../../../../../constants.dart';
import '../../../../../model/read_bp_model.dart';
import '../../../../../services/bill_to_service.dart';
import '../../../../../services/ship_to_service.dart';
import '../bp_address/all_addresses.dart';
import '../bp_contact_fields.dart';
import '../../../../../services/bp_service.dart';
import '../../../../../widgets/drop_down_widget/bptyp_drop_down.dart';
import '../../../../../model/bp_model.dart';
import '../../../../../model/contact_model.dart';
import '../edit_bp.dart';
import '../bp_transaction_screen.dart';

class BpCustomerView extends StatefulWidget {
  const BpCustomerView(
      {super.key, this.bp, this.contact, this.billAddModel, this.shipAddModel, this.rbp});

  final Rbp? rbp;
  final Bp?  bp;
  final ContactInfo? contact;
  final BillAddModel? billAddModel;
  final ShipAdd? shipAddModel;


  @override
  State<BpCustomerView> createState() => _BpCustomerViewState();
}
   final bp = Bp();
    final contact =ContactInfo();
    String cntName="";
    String billStreet="";
    String shipStreet="";
    //final bpId=bp.id;

class _BpCustomerViewState extends State<BpCustomerView> {
  late List<ContactInfo> contactInfoList = <ContactInfo>[];
  late List<Bp> bpList = <Bp>[];
  ContactInfo contact = ContactInfo();
  BillAddModel billAddModel = BillAddModel();
  ShipAdd shipAddModel = ShipAdd();
  final _cInfo = BpContactService();

  /*getContactInfoByID() async{
    var ctInfo = await _cInfo.readContactInfoByID(bpId);
    ctInfo.forEach((bpCInfo) {
      setState(() {
        var bpCInfoModel = ContactInfo();
        bpCInfoModel.bpId = bpCInfo["bpId"];
        contactInfoList.add(bpCInfoModel);

      });
    });


  }*/
  getAllBpInfo() async {
    var bpInfo = await _cInfo.readAllBp();
    bpInfo.forEach((bpMap) {
      setState(() {
        var bpModel = Bp();
        bpModel.id = bpMap["id"];
        bpModel.code = bpMap["code"];
        bpModel.name = bpMap["name"];
        bpModel.telephone = bpMap["telephone"];
        bpModel.email = bpMap["email"];
        bpModel.webSite = bpMap["webSite"];
        bpModel.bpType = bpMap["bpType"];
        bpModel.salesEmployee = bpMap["salesEmployee"];
        bpModel.priceList = bpMap["priceList"];
        bpList.add(bpModel);

      });
    });
  }

  readContactName() async {
    var contactService = BpContactService();
    //bpn="";
    var bpInfo = await contactService.readAllBp();
    bpInfo.forEach((bpMap) {
      var contactModel = ContactInfo();
      contactModel.bpId = bpMap["bpId"];

      try {
        if (contactModel.bpId == widget.bp?.id) {
          cntName = bpMap["contactName"];
        }
      }
      on Exception catch (_, e) {}
    });
    print('bpn is $cntName');

  }

  readBillName() async {
    var billToService = BillToService();
    //bpn="";
    var billInfo = await billToService.readAllBp();
    billInfo.forEach((bpMap) {
      var billModel = BillAddModel();
      billModel.b_id = bpMap["b_id"];

      try {
        if (billModel.b_id == widget.bp?.id) {
          billStreet = bpMap["street"];
        }
      }
      on Exception catch (_, e) {}
    });
    print('billStreet is $billStreet');

  }
  readShipName() async {
    var shipToService = ShipToService();
    //bpn="";
    var shipInfo = await shipToService.readAllBp();
    shipInfo.forEach((shipAddMap) {
      var shipModel = ShipAdd();
      shipModel.sId = shipAddMap["s_id"];

      try {
        if (shipModel.sId == widget.bp?.id) {
           shipStreet = shipAddMap["street"];
        }
      }
      on Exception catch (_, e) {}
    });
    print('shipStreet is $shipStreet');

  }



  @override
  void initState(){
    super.initState();
    readContactName();
    readBillName();
    readShipName();


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: 'Bp Info',
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
                        builder: (context) => const BusinessPartnersScreen()))
        ),
      ),

      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.18,
            child: Card(
              color: Colors.white38,
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/images/customer_icon.svg',
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.20,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.13,
                        colorFilter: const ColorFilter.mode(
                            kPrimaryColor, BlendMode.srcIn)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          widget.bp?.name ?? " ",
                          style: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.bp?.bpType ?? " ",
                          style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.bp?.code ?? " ",
                          style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: DefaultTabController(
            initialIndex: 0,
            length: 3,
            child: Column(
                children: [
            Container(
            margin: const EdgeInsets.only(left: 0.0),
            //width: MediaQuery.of(context).size.width,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.09,
            //child: Align(
            //alignment: Alignment.center,
            child: TabBar(
              //tabAlignment: TabAlignment.fill,
              labelStyle: const TextStyle(
                  fontSize: 13.0, fontWeight: FontWeight.bold),
              indicatorColor: Colors.indigo,
              indicatorSize: TabBarIndicatorSize.tab,
              //isScrollable: true,
              labelColor: Colors.indigo,
              labelPadding:
              const EdgeInsets.only(left: 5.0, right: 5.0),
              unselectedLabelColor: Colors.indigo[300],
              tabs: const [
                Tab(text: "GENERAL"),
                Tab(text: "ADDR/"
                    "CONTACT",
                ),
                Tab(text: "TRANSACTIONS"),
              ],
            ),
            //),
          ),
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.55,
            child: TabBarView(
                children: [
            SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.55,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.11,

                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sales Employee",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: kPrimaryColor
                              ),
                            ),
                            const SizedBox(height: 10.0,),
                            Text(widget.bp?.salesEmployee ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.black
                              ),
                            ),


                          ],
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.11,

                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Price List",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: kPrimaryColor
                              ),
                            ),
                            const SizedBox(height: 10.0,),
                            Text(widget.bp?.priceList ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),

                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.11,

                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Telephone",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: kPrimaryColor
                              ),
                            ),
                            const SizedBox(height: 10.0,),
                            Text(widget.bp?.telephone ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),

                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.11,

                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: kPrimaryColor
                              ),
                            ),
                            const SizedBox(height: 10.0,),
                            Text(widget.bp?.email ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),


                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.11,

                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "WebSite",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: kPrimaryColor
                              ),
                            ),
                            const SizedBox(height: 10.0,),
                            Text(widget.bp?.webSite??"",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.black
                              ),
                            ),


                          ],
                        ),
                      ),

                    ),

                  ),


                  Text('${widget.bp?.id??""}',
                    style: const TextStyle(

                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black
                    ),
                  ),


                ],
              ),
            ),

          ),

          Column(
              children: [
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.11,

                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Main Contact",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: kPrimaryColor
                              ),
                            ),
                            const SizedBox(height: 10.0,),
                            Text(cntName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.black
                              ),
                            ),
                          ]
                      ),),
                  ),),
                const SizedBox(height: 5.0,),

                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.08,

                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ReadAllContact()));
                      },
                      title: const Text(
                        "All Contact",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: kPrimaryColor
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15.0,),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.11,

                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "BillTo",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: kPrimaryColor
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Text(billStreet,
                            style: const TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),

                ),

                const SizedBox(
                  height: 10.0,
                ),

                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.11,

                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "shipTo",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: kPrimaryColor
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Text(shipStreet,
                            style: const TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),

                ),

                const SizedBox(height: 5.0,),

                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.08,

                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllAddresses()));
                      },
                      title: const Text(
                        "All Addresses",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: kPrimaryColor
                        ),
                      ),
                    ),
                  ),
                ),


                //child: const BpContactViewScreen(),


              ]),
          SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.57,

              child: const BpTransaction(),

        ),

      ],
      ),
    ),
    ],
    ),
    ),
    ),
    ])
    ,
    );
  }
}
