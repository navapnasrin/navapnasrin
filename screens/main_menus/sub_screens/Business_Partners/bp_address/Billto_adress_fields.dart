import 'package:flutter/material.dart';
import 'package:my_sap_app/services/bill_to_service.dart';
import 'package:my_sap_app/services/bp_service.dart';

import '../../../../../constants.dart';
import '../../../../../model/bill_to_model.dart';
import '../../../../../model/bp_model.dart';
import '../../../../../widgets/custom_submit_button.dart';
import '../../../../../widgets/custom_text_form.dart';
import '../add_bp.dart';
//import '../bp_contact_fields.dart';
import 'country_picker.dart';

class BillToAddressFields extends StatefulWidget {
  const BillToAddressFields({super.key});

  @override
  State<BillToAddressFields> createState() => _BillToAddressFieldsState();
}

TextEditingController addressNameController = TextEditingController();
TextEditingController postalController = TextEditingController();
TextEditingController streetController = TextEditingController();

final _billToService = BillToService();
int bpId= 0;
final _bpService = BpService();
final List<Bp> bpList=<Bp>[];

class _BillToAddressFieldsState extends State<BillToAddressFields> {

  getAllBpInfo() async {
    var bpInfo = await _bpService.readAllBp();
    bpInfo.forEach((bpMap) {
      setState(() {
        var bpModel = Bp();
        bpModel.id = bpMap["id"];
        try {
          bpId = bpModel.id!;
        }
        on Exception catch (_, e){
          bpId=0;
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
                      controller: addressNameController,
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    const CountryPicker(),
                    const SizedBox(height: defaultPadding,),
                    CustomTextFormField(
                      isObscure: false,
                      label: "Street",
                      controller: streetController,
                    ),
                    const SizedBox(height: defaultPadding,),
                    CustomTextFormField(
                      isObscure: false,
                      label: "Postal Code",
                      controller: postalController,
                    ),

                    const SizedBox(height: defaultPadding,),

                    CustomSubmitButton(
                        text: "Submit",
                        onTap: ()async{
                          var billAddModel=BillAddModel();
                          bpId=bpId+1;
                          //print("bill_bpId is :$bpId");
                          billAddModel.b_id=bpId;
                          print('bp id is ${billAddModel.b_id}');
                          billAddModel.billName
                          =addressNameController.text;
                          billAddModel.country=selectCountry;
                          billAddModel.state=selectState;
                          billAddModel.city=selectCity;
                          billAddModel.street=streetController.text;
                          billAddModel.postalCode=postalController.text;

                          var result = await _billToService.saveBillTo(billAddModel);
                          Navigator.push(context, MaterialPageRoute(builder: (result)=>const AddBp()));
                          print(result);


                        })




                  ],
                ),
              ],
            ),
          ),
        );
  }
}
