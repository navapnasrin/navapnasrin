import 'package:flutter/material.dart';
import 'package:my_sap_app/constants.dart';
class CustomButton extends StatelessWidget {
   const CustomButton({super.key, required this.btnText, this.onPress});
  final VoidCallback? onPress;
  final String btnText;
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width*50,
      height: MediaQuery.of(context).size.height*0.080,
      child: ElevatedButton(
          onPressed: onPress,
        style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor,
            elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        )),
          child: Center(
            child: Text(
              btnText,
              style: const TextStyle(color: Colors.white),
            ),
          ),
      ),
    );
  }
}


