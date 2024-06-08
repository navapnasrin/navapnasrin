import 'package:flutter/material.dart';
import 'package:my_sap_app/model/bill_to_model.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_address/all_bill_to_addresses.dart';
import 'package:my_sap_app/services/bill_to_service.dart';

import '../../../../../constants.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../../../../../widgets/custom_submit_button.dart';
import '../../../../../widgets/custom_text_form.dart';
import '../../../../../widgets/dialog_screen/custom_dialog_widget.dart';
import '../../../../../widgets/dialog_screen/ok_btn.dart';
import 'country_picker.dart';

class UpdateBillToAddress extends StatefulWidget {
  const UpdateBillToAddress({super.key, required this.billAddModel});

  final BillAddModel billAddModel;

  @override
  State<UpdateBillToAddress> createState() => _UpdateBillToAddressState();
}

TextEditingController addressNameController = TextEditingController();
TextEditingController postalController = TextEditingController();
TextEditingController streetController = TextEditingController();
final country=selectCountry;

class _UpdateBillToAddressState extends State<UpdateBillToAddress> {

  final billToService=BillToService();

  @override
  void initState(){
    setState(() {
      addressNameController.text=widget.billAddModel.billName??" ";
      postalController.text=widget.billAddModel.postalCode??"";
      streetController.text=widget.billAddModel.street??"";
      selectCountry=widget.billAddModel.country;
      selectState=widget.billAddModel.state;
      selectCity=widget.billAddModel.city;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
        text: "Edit BillTo Address",
        icon: IconButton(
        onPressed:()=>Navigator.push(context,
        MaterialPageRoute(builder: (context)=>const AllBillToAddresses())),
    icon:const Icon(Icons.arrow_back_ios_new_outlined,color: appBarColor,size: 20.0,),
    ),),

      body: ListView(
      children:[
      Column(
        children: [
          SizedBox(
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
                          text: "Update",
                          onTap: ()async{
                            final billAddModel=BillAddModel();
                            billAddModel.billId=widget.billAddModel.billId;
                            //print('bill id is click:${widget.billAddModel.billId}');
                            billAddModel.billName =addressNameController.text;
                            billAddModel.country=selectCountry;
                            billAddModel.state=selectState;
                            billAddModel.city=selectCity;
                            billAddModel.street=streetController.text;
                            billAddModel.postalCode=postalController.text;


                            var result = await billToService.updateBillTo(billAddModel);
                            Navigator.pop(context,result);
                            //print(result);


                          })




                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ]

      ),
    );
  }

}
