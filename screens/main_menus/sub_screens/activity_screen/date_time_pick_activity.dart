import 'package:flutter/material.dart';
import 'package:my_sap_app/widgets/custom_text_form.dart';
import 'package:intl/intl.dart';

class DateTimePickerActivity extends StatefulWidget {
  const DateTimePickerActivity({super.key});

  @override
  State<DateTimePickerActivity> createState() => _DateTimePickerActivityState();
}

int format =0;

class _DateTimePickerActivityState extends State<DateTimePickerActivity> {
  DateTime selectedDate=DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd  HH:mm');

  TextEditingController date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomTextFormField(
           controller: date,
            isObscure: false,
            label: "Start Time",
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
                    //(date.text=dateFormat.format(selectedDate))as int
                );
                date.text=dateFormat.format(selectedDate);
                //(date.text=format.toString())  as int;

              });
        
          },
        ),
        
        Text(dateFormat.format(selectedDate))
      ],
    );
  }

  Future<TimeOfDay?> selectTime(BuildContext context){
    final now = DateTime.now();
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
