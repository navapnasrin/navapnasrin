import 'package:flutter/material.dart';
import 'package:my_sap_app/model/ship_to_model.dart';
import 'package:my_sap_app/services/bp_service.dart';
import 'package:my_sap_app/services/ship_to_service.dart';

import '../../../../../constants.dart';
import '../../../../../model/bp_model.dart';
import '../../../../../widgets/custom_submit_button.dart';
import '../../../../../widgets/custom_text_form.dart';
import '../add_bp.dart';
import '../bp_contact_fields.dart';
import 'country_picker.dart';

class ShipToAddressFields extends StatefulWidget {
  const ShipToAddressFields({super.key});

  @override
  State<ShipToAddressFields> createState() => _ShipToAddressFieldsState();
}

TextEditingController shipAddressNameController = TextEditingController();
TextEditingController shipPostalController = TextEditingController();
TextEditingController shipStreetController = TextEditingController();

var _shipToService=ShipToService();
var _bpService=BpService();
int sipId=0;
final List<Bp> bpList=<Bp>[];


class _ShipToAddressFieldsState extends State<ShipToAddressFields> {

  getAllBpInfo() async {
    var bpInfo = await _bpService.readAllBp();
    bpInfo.forEach((bpMap) {
      setState(() {
        var bpModel = Bp();
        bpModel.id = bpMap["id"];
        try {
          sipId = bpModel.id!;
        }
        on Exception catch (_, e){
          sipId=0;
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
        bpList.add(bpModel);

      });
    });
  }

  @override
  void initState(){
    super.initState();
    getAllBpInfo();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height,
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
                  controller: shipAddressNameController,
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                const CountryPicker(),
                const SizedBox(height: defaultPadding,),
                CustomTextFormField(
                  isObscure: false,
                  label: "Street",
                  controller: shipStreetController,
                ),
                const SizedBox(height: defaultPadding,),
                CustomTextFormField(
                  isObscure: false,
                  label: "Postal Code",
                  controller: shipPostalController,
                ),
                const SizedBox(height: defaultPadding,),

                CustomSubmitButton(
                    text: "Submit",
    onTap: ()async {
      var shipAdd = ShipAdd();
      sipId=sipId+1;
      shipAdd.sId=sipId;
      shipAdd.name = shipAddressNameController.text;
      shipAdd.country = selectCountry;
      shipAdd.state = selectState;
      shipAdd.city = selectCity;
      shipAdd.street = shipStreetController.text;
      shipAdd.postalCode = shipPostalController.text;

      var result = await _shipToService.saveShipTo(shipAdd);
      Navigator.push(
          context, MaterialPageRoute(builder: (result) => const AddBp()));
      print(result);

      setState(() {
        shipAddressNameController.text = "";
        shipStreetController.text = "";
        shipPostalController.text = "";
        selectCountry = "";
        selectState = "";
        selectCity = "";
      });

    })


              ],
            ),
          ],
        ),
      ),
    );
  }
}
