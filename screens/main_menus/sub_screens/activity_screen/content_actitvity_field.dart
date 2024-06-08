import 'package:flutter/material.dart';
import 'package:my_sap_app/widgets/custom_text_form.dart';

class ContentActivityField extends StatefulWidget {
  const ContentActivityField({super.key});

  @override
  State<ContentActivityField> createState() => _ContentActivityFieldState();
}

TextEditingController contentActivityController=TextEditingController();

class _ContentActivityFieldState extends State<ContentActivityField> {
  @override
  Widget build(BuildContext context) {
    return  CustomTextFormField(
      controller: contentActivityController,
        isObscure: false,
        label: 'Content');
  }
}
