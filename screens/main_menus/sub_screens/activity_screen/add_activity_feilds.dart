import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_sap_app/model/activity_model.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/view_bp.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/business_partners_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/custom_bpButton.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/activities_screen.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/activity_drop_down.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/activity_more_field.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/contact_radio_view.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/content_actitvity_field.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/date_time_pick_activity.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/date_time_picker.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/end_time_date_picker.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/end_time_picker_activtiy.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/handled_by.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/link_dropdown.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/remark_field.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/start_time_button.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/subject_drop_down.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/type_dropdwn.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/type_radio_button_.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/more_screen.dart';
import 'package:my_sap_app/widgets/custom_submit_button.dart';
import 'package:my_sap_app/widgets/custom_text_form.dart';
import 'package:my_sap_app/widgets/drop_down_widget/bptyp_drop_down.dart';
import 'package:my_sap_app/widgets/radio_button/custom_radio_btn.dart';
import 'package:my_sap_app/widgets/radio_button/radiobtn_bptyp_screen.dart';

import '../../../../constants.dart';
import '../../../../model/bp_model.dart';
import '../../../../widgets/custom_appbar.dart';
import 'all_business_partners_view.dart';
import 'contact_dropDown.dart';
import 'cupertino_date_picker.dart';

class AddActivityFields extends StatefulWidget {
  const AddActivityFields({super.key,   this.bpModel});

  final Bp? bpModel;

  @override
  State<AddActivityFields> createState() => _AddActivityFieldsState();
}


TextEditingController bpController=TextEditingController();
TextEditingController _selectContact=TextEditingController();

class _AddActivityFieldsState extends State<AddActivityFields> {



  @override
  Widget build(BuildContext context) {
    //final String name=widget.bpModel?.name??"";

    setState(() {
      bpController.text=bpName??" ";
      //print(bpName);
      _selectContact.text=selectedCnt;
    });


    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.8,
        height: MediaQuery.of(context).size.height,
        child:   ListView(
          children:[ Column(
            children: [
                const ActivityDropDown(),

              const SizedBox(
                height: miniPadding,
              ),

              CustomTextFormField(
                controller: bpController,
                  isObscure: false,
                  label: "Business Partners",
                onTap:() {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>  const AllBusinessPartnersView()));
                }),


              const SizedBox(
                height: miniPadding,
              ),

               CustomTextFormField(isObscure: false,
                  controller: _selectContact,
                  label:'Contact',
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactRadioList(
                  bp: bp,
                )));
                },
              ),
              const SizedBox(
                height: miniPadding,
              ),

              const TypeDropDown(),

              const SizedBox(
                height: miniPadding,
              ),

              const SubjectDropDown(),

              const SizedBox(
                height: miniPadding,
              ),

              const LinkDropDown(),

              const SizedBox(
                height:miniPadding,
              ),

              const RemarkFormField(),

              const SizedBox(
                height:miniPadding,
              ),

              const ContentActivityField(),

              const SizedBox(
                height:miniPadding,
              ),
              const ActivityHandledBy(),

              const SizedBox(
                height:miniPadding,
              ),

              const DateTimePickerActivity(),

              const SizedBox(
                height:miniPadding,
              ),

              const EndTimePickerActivity(),

              const SizedBox(
                height:miniPadding,
              ),

              const ActivityMoreField(),

              const SizedBox(
                height:miniPadding,
              ),

              CustomSubmitButton(
                  text: "Submit",
                  onTap: (){
                    var actModel=ActivityModel();
                    actModel.activity=selectActivity;
                    actModel.bp=bpController.text??"";
                    actModel.contact=_selectContact as String?;
                    actModel.type=selectType??"";

                  }),

              const SizedBox(
                height:miniPadding,
              ),


















            ],
          ),
      ]
        ),
      ),
    );
  }
}
