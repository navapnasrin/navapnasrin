import 'package:flutter/material.dart';
import 'package:my_sap_app/model/bill_to_model.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/ship_to_address.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/shipto_address_fields.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/update_shipto_address.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/view_shipto_info.dart';
import 'package:my_sap_app/services/bill_to_service.dart';

import '../../../../../constants.dart';
import '../../../../../model/ship_to_model.dart';
import '../../../../../services/ship_to_service.dart';
import '../../../../../widgets/dialog_screen/custom_dialog_widget.dart';
import '../../../../../widgets/dialog_screen/ok_btn.dart';
import '../business_partners_screen.dart';

class ReadAllShipToAddress extends StatefulWidget {
  const ReadAllShipToAddress({super.key});

  @override
  State<ReadAllShipToAddress> createState() => _ReadAllShipToAddressState();
}

class _ReadAllShipToAddressState extends State<ReadAllShipToAddress> {

  late List<ShipAdd> shipAddressList=<ShipAdd>[];
  final shipToService=ShipToService();

  getAllBpInfo() async {
    var shipToAddModel = await shipToService.readAllBp();
    shipToAddModel.forEach((shipAddMap) {
      setState(() {
        var shipToModel = ShipAdd();
        shipToModel.shipId = shipAddMap["shipId"];
        shipToModel.name = shipAddMap["name"];
        shipToModel.country = shipAddMap["country"];
        shipToModel.state = shipAddMap["state"];
        shipToModel.street = shipAddMap["street"];
        shipToModel.postalCode = shipAddMap["postalCode"];

        shipAddressList.add(shipToModel);
      });
    });
  }

  shipInfoById() async {
    var shipToAdd = await shipToService.readShipInfoById(cBpId);
    print('bp id =$cBpId');
    shipToAdd.forEach((shipAddMap) {
      setState(() {
        var shipToModel = ShipAdd();
        shipToModel.shipId = shipAddMap["shipId"];
        shipToModel.name = shipAddMap["name"];
        shipToModel.country = shipAddMap["country"];
        shipToModel.city=shipAddMap["city"];
        shipToModel.state = shipAddMap["state"];
        shipToModel.street = shipAddMap["street"];
        shipToModel.postalCode = shipAddMap["postalCode"];
        shipToModel.sId=shipAddMap["sId"];
        //
        // print('billMap b_id=${billToModel.b_id}');

        shipAddressList.add(shipToModel);
      });
    });
  }




  showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void initState() {
    super.initState();
    //getAllBpInfo();
    shipInfoById();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: shipAddressList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewShipToInfo(
                            shipAdd: shipAddressList
                            [index],
                          )));
                },
                title: Text(
                  shipAddressList[index].name ?? ' ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: kPrimaryColor
                  ),
                ),
                subtitle: Text(shipAddressList[index].street ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> UpdateShipToAddress(
                                shipAdd: shipAddressList[index],
                                  ))).then((value) {
                                    if(value!=null){
                                      showSuccessSnackBar('Bp Updated Successfully');
                                    }

                          });
                        },
                        icon: const Icon(Icons.edit,
                            size: 20.0, color: kPrimaryColor)),
                    IconButton(
                        onPressed: () {
                          _deleteFormDialog(context, shipAddressList[index].shipId);
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
  _deleteFormDialog(BuildContext context, shipId) {
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
                      var result = await shipToService.deleteShipTo(shipId);
                      if (result != null) {
                        Navigator.of(context).pop();
                        shipAddressList.clear();
                        getAllBpInfo();
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

