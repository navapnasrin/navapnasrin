
import 'package:flutter/material.dart';
import 'package:my_sap_app/constants.dart';
import 'package:my_sap_app/model/contact_model.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/edit_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/view_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/add_bp.dart';
import 'package:my_sap_app/services/bp_service.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';
import 'package:my_sap_app/widgets/dialog_screen/custom_dialog_widget.dart';
import 'package:my_sap_app/widgets/dialog_screen/ok_btn.dart';

import '../../../../model/bp_model.dart';
import '../../../../model/read_bp_model.dart';
import '../../../../services/contact_service.dart';
import '../../../../widgets/drop_down_widget/bptyp_drop_down.dart';
import '../../main_menu.dart';
import '../../popup_menu_items.dart';
import 'bp_contact/view_bp.dart';
import 'bp_contact/view_bp.dart';

class BusinessPartnersScreen extends StatefulWidget {
  const BusinessPartnersScreen({super.key});

  @override
  State<BusinessPartnersScreen> createState() => _BusinessPartnersScreenState();
}

int cBpId =0;

class _BusinessPartnersScreenState extends State<BusinessPartnersScreen> {
  late List<Bp> customerList = <Bp>[];
  late List<Bp> vendorList = <Bp>[];
  late List<Bp> leadList = <Bp>[];
  late List<Bp> bpList = <Bp>[];
  late List <Rbp> ViewList=<Rbp>[];
  late List<ContactInfo> bpContactList = <ContactInfo>[];
  final bpContactService= BpContactService();

  final _bpService = BpService();
  //late List <Bp> data = [];

  /*Future loadList()async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final allBp =getAllBpInfo();
    final customer=readBpTypeByCustomer();
    final vendor=readBpTypeByVendor();
    final lead= readBpTypeByLead();
    setState(() {
      data=allBp;
      data=customer;
      data=vendor;
      data=lead;

    });

  }*/

  getAllContactBpInfo() async {
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
        bpContactList.add(contactModel);

      });
    });
  }



  getAllBpInfo() async {
    var bpInfo = await _bpService.readAllBp();
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
        bpModel.priceList = bpMap
        ["priceList"];
        bpList.add(bpModel);

      });
    });
  }

  readBpTypeByCustomer() async {
    var bpInfo = await _bpService.readBpTypeByCustomer(bpType);
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
        customerList.add(bpModel);
      });
    });
  }

  readBpTypeByVendor() async {
    var bpInfo = await _bpService.readBpTypeByVendor(bpType);
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
        vendorList.add(bpModel);
      });
    });
  }

  readBpTypeByLead() async {
    var bpInfo = await _bpService.readBpTypeByLead(bpType);
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
        leadList.add(bpModel);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAllBpInfo();
    readBpTypeByCustomer();
    readBpTypeByVendor();
    readBpTypeByLead();
    getAllContactBpInfo();


  }

  showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: 'Business Partners',
        //svg: SvgPicture.asset('assets/images/business_partners.svg',
        //color: appBarColor,),
        action: [
          IconButton(
            icon: const Icon(Icons.add, color: appBarColor),
            onPressed: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AddBp()))
                  .then((data) {
                if (data != null) {
                  bpList.clear();
                  customerList.clear();
                  vendorList.clear();
                  leadList.clear();

                  getAllBpInfo();
                  readBpTypeByCustomer();
                  readBpTypeByVendor();
                  readBpTypeByLead();



                  showSuccessSnackBar('Bp Added Successfully');
                }
              });
            },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return PopupMenuItems.activityItems.map((String activityItems) {
                return PopupMenuItem(
                  height: MediaQuery.of(context).size.height * 0.070,
                  child: Text(activityItems),
                );
              }).toList();
            },
            icon: const Icon(
              Icons.more_vert,
              color: appBarColor,
            ),
          ),
        ],
        icon: IconButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainMenuFields())),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: appBarColor,
            size: 20.0,
          ),
        ),
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 0.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.11,
              child: Align(
                alignment: Alignment.center,
                child: TabBar(
                  labelStyle: const TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.bold),
                  indicatorColor: Colors.indigo,
                  indicatorSize: TabBarIndicatorSize.tab,
                  //isScrollable: true,
                  labelColor: Colors.indigo,
                  labelPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  unselectedLabelColor: Colors.indigo[300],
                  tabs: const [
                    Tab(text: "My"),
                    Tab(text: "Customer"),
                    Tab(text: "Vendor"),
                    Tab(text: "Lead")
                  ],
                ),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: TabBarView(
                  children: [
                    SizedBox(
                        child: ListView.builder(
                            itemCount: bpList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BpCustomerView(
                                              bp:bpList[index],
                                                ))).then((value) {
                                                  setState(() {
                                                    cBpId=bpList[index].id!;
                                                  });
                                    });

                                    //print(id);

                                  },
                                  title: Text(
                                    bpList[index].name ?? ' ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      color: kPrimaryColor
                                    ),
                                  ),
                                  subtitle: Text(bpList[index].code ?? ''),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => EditBpInfo(
                                                      bp: bpList[index],
                                                      contact: bpContactList[index],

                                                    ))).then((data) {
                                              if (data != null) {

                                                bpList.clear();
                                                customerList.clear();
                                                vendorList.clear();
                                                leadList.clear();

                                                getAllBpInfo();
                                                readBpTypeByCustomer();
                                                readBpTypeByVendor();
                                                readBpTypeByLead();


                                                showSuccessSnackBar('Bp Updated Successfully');
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.edit,
                                              size: 20.0, color: kPrimaryColor)),
                                      IconButton(
                                          onPressed: () {
                                            _deleteFormDialog(
                                                context, bpList[index].id);
                                          },
                                          icon: const Icon(Icons.delete,
                                              size: 20.0, color: Colors.red)),

                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),

                    SizedBox(
                        child: ListView.builder(
                            itemCount: customerList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BpCustomerView(
                                                  bp: customerList[index],

                                                ))).then((value) {
                                      setState(() {
                                        cBpId=bpList[index].id!;
                                      });
                                    });
                                  },
                                  title: Text(
                                    customerList[index].name ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: kPrimaryColor
                                    ),
                                  ),
                                  subtitle: Text(customerList[index].code ?? ''),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => EditBpInfo(
                                                      bp: customerList[index],
                                                    ))).then((data) {
                                              if (data != null) {

                                                bpList.clear();
                                                customerList.clear();
                                                vendorList.clear();
                                                leadList.clear();

                                                getAllBpInfo();
                                                readBpTypeByCustomer();
                                                readBpTypeByVendor();
                                                readBpTypeByLead();

                                                showSuccessSnackBar('Bp Updated Successfully');
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.edit,
                                              size: 20.0, color: kPrimaryColor)),
                                      IconButton(
                                          onPressed: () {
                                            _deleteFormDialog(
                                                context, customerList[index].id);
                                          },
                                          icon: const Icon(Icons.delete,
                                              size: 20.0, color: Colors.red))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),


                    // Vendor
                    SizedBox(
                        child: ListView.builder(
                            itemCount: vendorList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BpCustomerView(
                                                  bp: vendorList[index],
                                                )));

                                  },
                                  title: Text(
                                    vendorList[index].name ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: kPrimaryColor
                                    ),
                                  ),
                                  subtitle: Text(vendorList[index].code ?? ''),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => EditBpInfo(
                                                      bp: vendorList[index]
                                                    ))).then((data) {
                                              if (data != null) {

                                                bpList.clear();
                                                customerList.clear();
                                                vendorList.clear();
                                                leadList.clear();

                                                getAllBpInfo();
                                                readBpTypeByCustomer();
                                                readBpTypeByVendor();
                                                readBpTypeByLead();

                                                showSuccessSnackBar('Bp Updated Successfully');
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.edit,
                                              size: 20.0, color: kPrimaryColor)),
                                      IconButton(
                                        onPressed: () async {
                                          await _deleteFormDialog(
                                              context, vendorList[index].id);
                                        },
                                        icon: const Icon(Icons.delete,
                                            size: 20.0, color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),

                    //Lead
                    SizedBox(

                        child: ListView.builder(
                            itemCount: leadList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BpCustomerView(
                                                  bp: leadList[index],
                                                )));
                                  },
                                  title: Text(
                                    leadList[index].name ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: kPrimaryColor
                                    ),
                                  ),
                                  subtitle: Text(leadList[index].code ?? ''),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => EditBpInfo(
                                                      bp: leadList[index],
                                                    ))).then((data) {
                                              if (data != null) {
                                                bpList.clear();
                                                customerList.clear();
                                                vendorList.clear();
                                                leadList.clear();


                                                getAllBpInfo();
                                                readBpTypeByCustomer();
                                                readBpTypeByVendor();
                                                readBpTypeByLead();();

                                                showSuccessSnackBar('Bp Updated Successfully');
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.edit,
                                              size: 20.0, color: kPrimaryColor)),
                                      IconButton(
                                          onPressed: () {
                                            _deleteFormDialog(
                                                context, leadList[index].id);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 20.0,
                                            color: Colors.red,
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  _deleteFormDialog(BuildContext context, bpId) {
    return showDialog(
      context: context,
      builder: (context) => CustomDialogWidget(
          text: "Are u sure to Delete?",
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OkBtn(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: "Cancel"),
                OkBtn(
                    onTap: () async {
                      var result = await _bpService.deleteBp(bpId);
                      if (result != null) {
                        Navigator.of(context).pop();
                        bpList.clear();
                        customerList.clear();
                        vendorList.clear();
                        leadList.clear();

                        getAllBpInfo();
                        readBpTypeByCustomer();
                        readBpTypeByVendor();
                        readBpTypeByLead();
                        showSuccessSnackBar("Bp Deleted Successfully");
                      }
                    },
                    text: "OK"),
              ],
            ),
          ],
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.80),
    );
  }
}
