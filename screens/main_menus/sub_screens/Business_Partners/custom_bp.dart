import 'package:flutter/material.dart';
import 'package:my_sap_app/widgets/dialog_screen/custom_dialog_widget.dart';
import 'package:my_sap_app/widgets/dialog_screen/dialog_text_form.dart';

import '../../../../constants.dart';
class CustomBp extends StatelessWidget {
   const CustomBp({super.key,
    required this.title,
     this.onPress, this.icon,

     });

  final String title;
  final Function? onPress;
  final IconData? icon;
  

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.11,
      child: GestureDetector(
        onTap: onPress as void Function()?,
        child: Card(
          color: Colors.white60,
          shape: const RoundedRectangleBorder(
            borderRadius:BorderRadius.zero,
          ),
          elevation: 1,
          child: Padding(
            padding:const  EdgeInsets.all(2.0),

            child: ListTile(
              trailing: Icon(icon,
                  color: kPrimaryColor,
                  size:20.0),
              title: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(color:kPrimaryColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),




                    ],
                  ),
              ),
              ),
            ),
          ),

        ),
    );  }
}
