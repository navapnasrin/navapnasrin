import 'package:flutter/material.dart';
import 'package:my_sap_app/widgets/custom_text_form.dart';

class RemarkFormField extends StatefulWidget {
  const RemarkFormField({super.key});

  @override
  State<RemarkFormField> createState() => _RemarkFormFieldState();
}

TextEditingController remarkActivityController=TextEditingController();

class _RemarkFormFieldState extends State<RemarkFormField> {
  @override
  Widget build(BuildContext context) {
    return  CustomTextFormField(
      controller: remarkActivityController,
        isObscure: false,
        label: 'Remark');
  }
}
