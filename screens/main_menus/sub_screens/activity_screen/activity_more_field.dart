import 'package:flutter/material.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/more_screen.dart';
import 'package:my_sap_app/widgets/custom_text_form.dart';

import 'activity_more_screen.dart';

class ActivityMoreField extends StatefulWidget {
  const ActivityMoreField({super.key});

  @override
  State<ActivityMoreField> createState() => _ActivityMoreFieldState();
}

class _ActivityMoreFieldState extends State<ActivityMoreField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        isObscure: false,
        label: 'More',
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ActivityMoreScreen()));
      },
    );
  }
}
