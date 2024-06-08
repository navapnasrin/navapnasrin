import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ActivityHandledBy extends StatefulWidget {
  const ActivityHandledBy({super.key});

  @override
  State<ActivityHandledBy> createState() => _ActivityHandledByState();
}

final employee= ['Navap','Hasan','Piriyadharsan',"Murali","Arun","Arumugam"];
String? selectEmployee="";


class _ActivityHandledByState extends State<ActivityHandledBy> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height*0.09,

      child: DropdownButtonFormField(
        items:  employee.map((e) => DropdownMenuItem(
          value: e,
          child: Text(e),)).toList(),
        onChanged: (val) {
          setState(() {
            selectEmployee=val;
          });
        },
        decoration:  InputDecoration(
          labelText: "Handled By",
          labelStyle: const TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold),
          border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(10.0)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:kPrimaryColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),),

    );

  }
}
