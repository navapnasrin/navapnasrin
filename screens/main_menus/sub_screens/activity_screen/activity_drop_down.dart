import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ActivityDropDown extends StatefulWidget {
  const ActivityDropDown({super.key});

  @override
  State<ActivityDropDown> createState() => _ActivityDropDownState();
}
final activityType= ['Phone call','Meeting','Task','Note','Other'];
String? selectActivity="";

class _ActivityDropDownState extends State<ActivityDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height*0.09,

      child: DropdownButtonFormField(
        items:  activityType.map((e) => DropdownMenuItem(
          value: e,
          child: Text(e),)).toList(),
        onChanged: (value) {
          setState(() {
            selectActivity=value;
          });
        },
        decoration: InputDecoration(
          labelText: "Activity",
          labelStyle: const TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold),

          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.indigo),
              borderRadius: BorderRadius.circular(10.0)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:kPrimaryColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),

    );
  }
}
