import 'package:flutter/material.dart';

import '../../../../constants.dart';

class LinkDropDown extends StatefulWidget {
  const LinkDropDown({super.key});

  @override
  State<LinkDropDown> createState() => _LinkDropDownState();
}


final link=["-No Link-"];
String? selectLinkTo="";

class _LinkDropDownState extends State<LinkDropDown> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height*0.09,

      child: DropdownButtonFormField(
        items:  link.map((e) => DropdownMenuItem(
          value: e,
          child: Text(e),)).toList(),
        onChanged: (value) {
          setState(() {
            selectLinkTo=value;
          });
        },
        decoration: InputDecoration(
          labelText: "Link To",
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
