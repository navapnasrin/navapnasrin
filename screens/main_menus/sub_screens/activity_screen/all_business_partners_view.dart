import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/contact_list.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/view_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/add_activities_screen.dart';

import '../../../../constants.dart';
import '../../../../model/bp_model.dart';
import '../../../../services/bp_service.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_search_appbar.dart';
import 'add_activity_feilds.dart';

class AllBusinessPartnersView extends StatefulWidget {
  const AllBusinessPartnersView({
    super.key,
    this.bp,
  });

  final Bp? bp;

  @override
  State<AllBusinessPartnersView> createState() =>
      _AllBusinessPartnersViewState();
}

String? bpName;
 int? bpnId=0;
TextEditingController _searchController=TextEditingController();

class _AllBusinessPartnersViewState extends State<AllBusinessPartnersView> {
  late List<Bp> bpList = <Bp>[];
  final _bpService = BpService();

  Icon cusIcon = const Icon(
    Icons.search,
    size: 30.0,
    color: appBarColor,
  );
  Widget? cusSearchBar = const Text(
    "Activities",
    style: TextStyle(
        color: appBarColor, fontSize: 25.0, fontWeight: FontWeight.bold),
  );

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
        bpModel.priceList = bpMap["priceList"];
        bpList.add(bpModel);
        //bpnId=bpMap["id"];
      });
    });
    //print('id is : $bpnId');

  }

  //late List<Bp> searchBpList = <Bp>[];

  @override
  void initState() {
    //searchBpList = bpList;
    super.initState();
    getAllBpInfo();

    _searchController.addListener(() {
      setState(() {
        filter=_searchController.text;
      });

    });
  }

  /*void _runFilter(String enteredText){
    late List<Bp>? result =<Bp>[];
    if(enteredText.isEmpty){
      result=bpList;

    }else{
      result=bpList.where((bp) => bp["name"].contains(enteredText)).toList();
    }

  }*/

  String filter="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size(25,25),
          child: SizedBox(),
        ),

            backgroundColor: kPrimaryColor,
        title: Padding(
          padding: const EdgeInsets.only(top:18.0),
          child: cusSearchBar,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0,top: 18.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (cusIcon.icon == Icons.search) {
                    cusIcon =  const Icon(Icons.cancel);
                    cusSearchBar = TextFormField(
                      textInputAction: TextInputAction.go,
                      controller: _searchController,
                      decoration:  InputDecoration(
                        hintText: "Search",
                          labelStyle: const TextStyle(color: kPrimaryColor),
                        hintStyle: const TextStyle(color: kPrimaryColor),
                        fillColor: Colors.indigo[50],
                        focusColor: appBarColor,
                        filled: true,
                        //border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color:kPrimaryColor),
                      onChanged: (val){
                        setState(() {
                          filter=val.toString();
                        });
                      },


                    );
                  }
                  else{
                    cusIcon = const Icon(
                      Icons.search,
                      size: 30.0,
                      color: appBarColor,
                    );
                    cusSearchBar = const Text(
                      "Activities",
                      style: TextStyle(
                          color: appBarColor, fontSize: 25.0, fontWeight: FontWeight.bold),
                    );


                  }
                });
              },
              icon: cusIcon,
              color: appBarColor,
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddActivities())),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: appBarColor,
              size: 20.0,
            ),
          ),
        ),
      ),
      body: SizedBox(
        child: ListView.builder(
            itemCount: bpList.length,
            itemBuilder: (context, index) {
              String name = bpList[index].name.toString();
              if (_searchController.text.isEmpty) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddActivities(
                                    bpModel: bpList[index],
                                  ))).then((value) {
                                    setState(() {

                                      bpName = bpList[index].name??"";
                                      print(bpName);
                                      bpnId=bpList[index].id!;

                                    });
                      });
                      //print('bp id is:$bpnId');
                    },
                    title: Text(
                      bpList[index].name ?? ' ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: kPrimaryColor),
                    ),
                    subtitle: Text(bpList[index].code ?? ''),
                    /*trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditBpInfo(
                                      bp: bpList[index],

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
                  ),*/
                  ),
                );
              } else if (name.toLowerCase().contains(
                  _searchController.text.toLowerCase())) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddActivities(
                                    bpModel: bpList[index],
                                  ))).then((value) {
                                    setState(() {

                                      bpName = bpList[index].name??"";
                                     // print(bpName);

                                    });

                      });
                    },
                    title: Text(
                      bpList[index].name ?? ' ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: kPrimaryColor),
                    ),
                    subtitle: Text(bpList[index].code ?? ''),
                    /*trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditBpInfo(
                                      bp: bpList[index],

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
                  ),*/
                  ),
                );
              } else {
                return const SizedBox();
              }
            }
            ),
      ),
    );
  }
}
