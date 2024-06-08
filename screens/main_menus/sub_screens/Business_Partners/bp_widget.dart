import 'package:flutter/material.dart';
import 'package:my_sap_app/widgets/dialog_screen/custom_dialog_widget.dart';

import '../../../../constants.dart';
class BpWidget extends StatelessWidget {
  const BpWidget({super.key,
    required this.title,
    required this.onPress, this.code, this.name,

  });

  final String title;
  final Function onPress;
  final String? code;
  final String? name;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.12,
            child: ListTile(
            ),



    );  }
}
