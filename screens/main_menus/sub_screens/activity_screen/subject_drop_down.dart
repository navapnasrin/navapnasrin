import 'package:flutter/material.dart';

import '../../../../constants.dart';

class SubjectDropDown extends StatefulWidget {
  const SubjectDropDown({super.key});

  @override
  State<SubjectDropDown> createState() => _SubjectDropDownState();
}


final subject=["-No Subject-"];
String? selectSubject="";

class _SubjectDropDownState extends State<SubjectDropDown> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height*0.09,

      child: DropdownButtonFormField(
        items:  subject.map((e) => DropdownMenuItem(
          value: e,
          child: Text(e),)).toList(),
        onChanged: (value) {
          setState(() {
            selectSubject=value;
          });
        },
        decoration: InputDecoration(
          labelText: "Subject",
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
