import 'package:flutter/material.dart';
import 'package:my_sap_app/model/bill_to_model.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/Billto_adress_fields.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/all_bill_to_addresses.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/update_billto_address.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/view_billto_info.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/business_partners_screen.dart';
import 'package:my_sap_app/services/bill_to_service.dart';

import '../../../../../constants.dart';
import '../../../../../db_helper/repository.dart';
import '../../../../../widgets/dialog_screen/custom_dialog_widget.dart';
import '../../../../../widgets/dialog_screen/ok_btn.dart';

class ReadAllBillToAddress extends StatefulWidget {
  const ReadAllBillToAddress({super.key});

  @override
  State<ReadAllBillToAddress> createState() => _ReadAllBillToAddressState();
}

class _ReadAllBillToAddressState extends State<ReadAllBillToAddress> {

  late List<BillAddModel> billAddressList=<BillAddModel>[];
  final billToService=BillToService();
  final repository=Repository();

  getAllBpInfo() async {
    var billToAddModel = await billToService.readAllBp();
    billToAddModel.forEach((billAddMap) {
      setState(() {
        var billToModel = BillAddModel();
        billToModel.billId = billAddMap["billId"];
        billToModel.billName = billAddMap["billName"];
        billToModel.country = billAddMap["country"];
        billToModel.city=billAddMap["city"];
        billToModel.state = billAddMap["state"];
        billToModel.street = billAddMap["street"];
        billToModel.postalCode = billAddMap["postalCode"];


        billAddressList.add(billToModel);
      });
    });
  }

  billInfoById() async {
    var billToAddModel = await billToService.readBillInfoById(cBpId);
    print('bp id =$cBpId');
    billToAddModel.forEach((billAddMap) {
      setState(() {
        var billToModel = BillAddModel();
        billToModel.billId = billAddMap["billId"];
        billToModel.billName = billAddMap["billName"];
        billToModel.country = billAddMap["country"];
        billToModel.city=billAddMap["city"];
        billToModel.state = billAddMap["state"];
        billToModel.street = billAddMap["street"];
        billToModel.postalCode = billAddMap["postalCode"];
        billToModel.b_id=billAddMap["b_id"];
        //
        // print('billMap b_id=${billToModel.b_id}');

        billAddressList.add(billToModel);
      });
    });
  }


  @override
        void initState() {
          super.initState();
         //getAllBpInfo();
          billInfoById();
        }

        @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: billAddressList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewBillToInfo(
                            billAddModel: billAddressList[index],
                          )));
                },
                title: Text(
                  billAddressList[index].billName ?? ' ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: kPrimaryColor
                  ),
                ),
                subtitle: Text(billAddressList[index].street ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateBillToAddress(
                                    billAddModel: billAddressList[index],
                                  )));
                        },
                        icon: const Icon(Icons.edit,
                            size: 20.0, color: kPrimaryColor)),
                    IconButton(
                        onPressed: () {
                          _deleteFormDialog(context, billAddressList[index].billId);
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
  _deleteFormDialog(BuildContext context, billId) {
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
                      var result = await billToService.deleteBillTo(billId);
                      if (result != null) {
                        Navigator.of(context).pop();
                       billAddressList.clear();

                       getAllBpInfo();
                       //showSuccessSnackBar("Bp Deleted Successfully");
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

