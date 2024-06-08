import 'package:flutter/material.dart';
import 'package:my_sap_app/widgets/custom_text_form.dart';
import 'package:path/path.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

TextEditingController _dateTime=TextEditingController();
DateTime? picker="" as DateTime?;

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return  CustomTextFormField(
        isObscure: false,
        label: 'Start Time',
        controller: _dateTime,
      onTap: ()async {
        picker = await showDatePicker(context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100)
        ).then((date) {
          showTimePicker(context: context,
              initialTime: TimeOfDay.now()).then((time) {
            if (picker != null) {
              setState(() {
                _dateTime.text = time!.format(context);
              });
            }
          });
        });
      }

      /*onTap: ()async{
        DateTime? pickedDate=await showDatePicker(context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100)
        );
        if(pickedDate !=null){
          setState(() {
            _dateTime.text=pickedDate.toString();
          });
        }

      },*/


    );

    }

  }

