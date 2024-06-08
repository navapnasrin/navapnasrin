import 'package:flutter/material.dart';
import 'package:my_sap_app/constants.dart';
import 'package:my_sap_app/model/bp_model.dart';
import '../../../../model/contact_model.dart';
import '../../../../services/bp_service.dart';
import '../../../../services/contact_service.dart';
import '../../../../widgets/custom_submit_button.dart';
import '../../../../widgets/custom_text_form.dart';
import 'add_bp.dart';
import 'bp_contact_fields.dart';

class BpContactFields extends StatefulWidget {
  const BpContactFields({super.key,});


  @override
  State<BpContactFields> createState() => _BpContactFieldsState();
}
 int id=0;
TextEditingController bpContactNameController = TextEditingController();
TextEditingController bpContactPositionController = TextEditingController();
TextEditingController bpContactTelephone1Controller = TextEditingController();
TextEditingController bpContactTelephone2Controller = TextEditingController();
TextEditingController bpContactEmailController = TextEditingController();
TextEditingController bpContactTitleController = TextEditingController();
TextEditingController bpContactMobileController = TextEditingController();
TextEditingController bpContactFaxController = TextEditingController();

var _bpContactService = BpContactService();


class _BpContactFieldsState extends State<BpContactFields> {
  late List<Bp> bpl = <Bp>[];
  final _bpService = BpService();




  getAllBpInfo() async {
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
  }

  @override
  void initState() {
    super.initState();
    getAllBpInfo();
  }




  @override
  Widget build(BuildContext context) {



    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height,
      child: Form(
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
                    controller: bpContactNameController,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  CustomTextFormField(
                    isObscure: false,
                    label: "Title",
                    controller: bpContactTitleController,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  CustomTextFormField(
                    isObscure: false,
                    label: "Position",
                    controller: bpContactPositionController,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  CustomTextFormField(
                    isObscure: false,
                    label: "Mobile",
                    controller: bpContactMobileController,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  CustomTextFormField(
                    isObscure: false,
                    label: "Telephone1",
                    controller: bpContactTelephone1Controller,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  CustomTextFormField(
                    isObscure: false,
                    label: "Telephone2",
                    controller: bpContactTelephone2Controller,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  CustomTextFormField(
                    isObscure: false,
                    label: "E-mail",
                    controller: bpContactEmailController,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  CustomTextFormField(
                    isObscure: false,
                    label: "Fax",
                    controller: bpContactFaxController,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  CustomSubmitButton(text: "Submit", onTap: () async{
                    var contact=ContactInfo();
                    var bp=Bp();
                    //
                    id=id+1;
                    contact.bpId=id;
                    print('contact Id is :${contact.bpId}');

                    contact.contactName=bpContactNameController.text;
                    contact.contactTitle=bpContactTitleController.text;
                    contact.contactPosition=bpContactPositionController.text;
                    contact.contactMobile=bpContactMobileController.text;
                    contact.contactTelephone1=bpContactTelephone1Controller.text;
                    contact.contactTelephone2=bpContactTelephone2Controller.text;
                    contact.contactEmail=bpContactEmailController.text;
                    contact.contactFax=bpContactFaxController.text;



                    var result = await _bpContactService.saveBp(contact);
                    Navigator.push(context, MaterialPageRoute(builder: (result)=>const AddBp()));
                    //print(result);
                    setState(() {
                      bpContactNameController.text=" ";
                      bpContactMobileController.text=" ";
                      bpContactTitleController.text=" ";
                      bpContactFaxController.text=" ";
                      bpContactEmailController.text=" ";
                      bpContactPositionController.text=" ";
                      bpContactTelephone1Controller.text=" ";
                      bpContactTelephone2Controller.text=" ";



                    });
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
