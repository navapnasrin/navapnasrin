import 'package:flutter/material.dart';

import '../../../../widgets/radio_button/custom_radio_btn.dart';

class TypeRadioButton extends StatefulWidget {
  const TypeRadioButton({super.key});

  @override
  State<TypeRadioButton> createState() => _TypeRadioButtonState();
}

dynamic? type = 'General';


class _TypeRadioButtonState extends State<TypeRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: SafeArea(
        child: Scaffold(
          body:SizedBox(

            width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.13,
        child:Column(
        children:[
        CustomRadioBtn(
        title: "General",
        onChanged: (val){
        setState(() {
        type=val;
        });

        },
        value: 'General',
        selectedBpTypEnum: type,
        ),
          ]
        )
          )
        ),
      ),
    );

  }
}
