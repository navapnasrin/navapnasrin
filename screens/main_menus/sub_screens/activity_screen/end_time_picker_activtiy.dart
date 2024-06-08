import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/custom_text_form.dart';

class EndTimePickerActivity extends StatefulWidget {
  const EndTimePickerActivity({super.key});

  @override
  State<EndTimePickerActivity> createState() => _EndTimePickerActivityState();
}
TextEditingController dateTime = TextEditingController();


class _EndTimePickerActivityState extends State<EndTimePickerActivity> {
  DateTime selectedDate=DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd  HH:mm');

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomTextFormField(
          controller: dateTime,
          isObscure: false,
          label: "End Time",
          onTap: ()async{
            final selectedDate=await selectDateTime(context);
            if(selectedDate==null) return;

            final selectedTime=await  selectTime(context);
            if(selectedTime==null) return;
            print(selectedTime);


            setState(() {
              this.selectedDate =DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
                //(date.text=dateFormat.format(selectedDate)) as int,
                //(date.text=dateFormat.format(selectedDate))as int
              );
              dateTime.text=dateFormat.format(selectedDate);
            });

          },
        ),

        Text(dateFormat.format(selectedDate))
      ],
    );
  }

  Future<TimeOfDay?> selectTime(BuildContext context){
    final now =DateTime.now();
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: now.hour, minute: now.minute));
  }

  Future<DateTime?> selectDateTime(BuildContext context){
    return showDatePicker(
      context: context,
      firstDate: DateTime(2000
      ),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

  }
}
