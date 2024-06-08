import 'package:flutter/material.dart';
import 'package:my_sap_app/widgets/login_image.dart';
import 'package:my_sap_app/screens/signup/signup_form.dart';

import '../../constants.dart';
class SignUpScreen extends StatelessWidget {
   const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:  Column(
              children: [
          SizedBox(
          width: MediaQuery.of(context).size.width*0.050,
          height: MediaQuery.of(context).size.height*0.080,
        ),
        const LoginImage(),
         const SignUpForm(),

        ],
        ),
      ),
      ),
    );
  }
}
