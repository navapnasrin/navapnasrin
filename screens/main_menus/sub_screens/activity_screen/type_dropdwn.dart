import 'package:flutter/material.dart';

import '../../../../constants.dart';

class TypeDropDown extends StatefulWidget {
  const TypeDropDown({super.key});

  @override
  State<TypeDropDown> createState() => _TypeDropDownState();
}
final type=["General"];
String? selectType="";

class _TypeDropDownState extends State<TypeDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height*0.09,

      child: DropdownButtonFormField(
        items:  type.map((e) => DropdownMenuItem(
          value: e,
          child: Text(e),)).toList(),
        onChanged: (value) {
          setState(() {
            selectType=value.toString();
          });
        },
        decoration: InputDecoration(
          labelText: "Type",
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
