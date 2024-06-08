import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_sap_app/constants.dart';
import 'package:my_sap_app/widgets/custom_text_form.dart';

class CupertinoDateTimePicker extends StatefulWidget {
  const CupertinoDateTimePicker({super.key});

  @override
  State<CupertinoDateTimePicker> createState() => _CupertinoDateTimePickerState();
}
TextEditingController _dateTime = TextEditingController();

class _CupertinoDateTimePickerState extends State<CupertinoDateTimePicker> {

  DateTime dateTime = DateTime(2024,2,1,10,20);
  @override
  Widget build(BuildContext context) {
    String format=Text('${dateTime.month}-${dateTime.day}-${dateTime.year}-${dateTime.hour}:${dateTime.minute}').toString();
    return CustomTextFormField(
        isObscure: false, label: 'Start Time',
      controller: _dateTime,
      onTap: (){
          showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context)=>
              SizedBox(
                height: MediaQuery.of(context).size.height*0.25,
                child:CupertinoDatePicker(
                  backgroundColor: appBarColor,
                  initialDateTime: dateTime,
                  onDateTimeChanged: (DateTime newTime){
                    setState(() {
                      dateTime=newTime;
                      _dateTime.text=format;
                      },
                    );
                  },
                  use24hFormat: true,
                ),
              )
          );

      },
    );
  }
}
