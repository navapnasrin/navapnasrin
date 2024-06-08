import 'package:flutter/material.dart';

class StartTimeButton extends StatefulWidget {
  const StartTimeButton({super.key});

  @override
  State<StartTimeButton> createState() => _StartTimeButtonState();
}

class _StartTimeButtonState extends State<StartTimeButton> {
  DateTime dateTime = DateTime(2024,12,24);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Start Time"),
        ElevatedButton(
            onPressed: ()async{
              final date=await pickDate();
            },
            child: Text("${dateTime.year}-${dateTime.month}-${dateTime.day}"))
      ],
    );
  }

  Future<DateTime?> pickDate()=> showDatePicker(
  context: context,
  firstDate: DateTime(1900),
  lastDate: DateTime(2100),
    initialDate: dateTime,
  );
}
