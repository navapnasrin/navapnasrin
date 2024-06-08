import 'package:flutter/material.dart';
import 'package:my_sap_app/constants.dart';

class CustomLoginSignupText extends StatelessWidget {
  const CustomLoginSignupText({super.key,
    required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: defaultPadding/2 ),
        Row(
          children: [
            //const Spacer(),
            Expanded(
                flex:1,
                child: Text(text,
                            style: const TextStyle(fontSize: 40.0,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold
                            ),

                            ),
            ),
            //const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding ),
      ],
    );
   /* return Column(
    children: [
      Text(text,
        style: const TextStyle(fontSize: 40.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.end
      ),
    ],
    );*/
  }
}
