import 'package:flutter/material.dart';

import '../../../../widgets/custom_text_form.dart';

class EndTimeDatePicker extends StatefulWidget {
  const EndTimeDatePicker({super.key});

  @override
  State<EndTimeDatePicker> createState() => _EndTimeDatePickerState();
}
TextEditingController _endTimeController= TextEditingController();
DateTime? picker;

class _EndTimeDatePickerState extends State<EndTimeDatePicker> {
  @override
  Widget build(BuildContext context) {
    return  CustomTextFormField(
        isObscure: false,
        label: 'End Time',
        controller: _endTimeController,
        onTap: ()async {
      picker = await showDatePicker(context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100)
      ).then((date) {
        showTimePicker(context: context,
            initialTime: TimeOfDay.now()).then((time) {
          if (picker != null) {
            setState(() {
              _endTimeController.text = time!.format(context);
            });
          }
        });
      });
    }
    );
  }
}
