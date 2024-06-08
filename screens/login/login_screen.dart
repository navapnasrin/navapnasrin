import 'package:flutter/material.dart';
import 'package:my_sap_app/constants.dart';
import 'package:my_sap_app/screens/login/login_form.dart';

import '../../widgets/login_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.050,
                  height: MediaQuery.of(context).size.height*0.080,
                ),
                const LoginImage(),
                const SizedBox(height: defaultPadding,),
                const LoginForm(),
              ],
            ),


              ),
            ),
          ),
    );
  }
}

