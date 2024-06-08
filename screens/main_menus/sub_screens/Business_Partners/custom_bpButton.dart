import 'package:flutter/material.dart';
import 'package:my_sap_app/constants.dart';

class CustomBpButton extends StatelessWidget {
  const CustomBpButton({
    super.key,
    required this.onTap, required this.text});

  final Function onTap;

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap as void Function()?,
      child: Container(
          width: MediaQuery.of(context).size.width*50,
          height: MediaQuery.of(context).size.height*0.08,

           decoration:BoxDecoration(
             borderRadius: BorderRadius.circular(10.0),
             border: const Border(
               bottom: BorderSide(color: kPrimaryColor,width: 1.0),
               top: BorderSide(color: kPrimaryColor,width: 1.0),
               right:  BorderSide(color: kPrimaryColor,width: 1.0),
               left:  BorderSide(color: kPrimaryColor,width: 1.0),

             )

          ),
            child: Align(
              alignment: Alignment.center,
              child: Text(text,
              style: const TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold),
              ),
            ),

          ),


    );
  }
}
