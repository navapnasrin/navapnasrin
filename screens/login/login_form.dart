import 'package:flutter/material.dart';
import 'package:my_sap_app/widgets/already_have_an_account_acheck.dart';
import 'package:my_sap_app/screens/main_menus/main_menu.dart';
import 'package:my_sap_app/widgets/custom_text_form.dart';
import 'package:my_sap_app/constants.dart';

import '../../widgets/custom_button.dart';
import '../signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey=GlobalKey<FormState>();
  TextEditingController userNameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool _isSecurePassword = true;
  @override
  Widget build(BuildContext context) {

    return  SizedBox(
      width: MediaQuery.of(context).size.width*0.80,
      height: MediaQuery.of(context).size.height,
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            /*TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Your password",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
            ),*/
             CustomTextFormField(
                isObscure:false,
                label:"UserName",
                controller: userNameController,
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.person),
               validator: (value){
                 if(value!.isEmpty){
                   return "Please enter username";
                 }else if(value.length<4){
                   return"Enter valid Username";
                 }return null;
               },
            ),
            const SizedBox(height: defaultPadding),
            CustomTextFormField(
              controller: passwordController,
              isObscure: _isSecurePassword,
              label: 'Password',
              validator: (value){
                if(value!.isEmpty){
                  return "Please enter password";
                }return null;
              },
              keyboardType: TextInputType.text,
              suffixIcon:togglePassword(),
              prefixIcon: const Icon(Icons.lock),


            ),
            const SizedBox(height: defaultPadding),
            CustomButton(
              onPress: () {
                if (_formkey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('LOGIN Success full'),
                    ),
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MainMenuFields();
                  }
                  ),
                  );
                }
                },
              btnText:"Login".toUpperCase(),
              ),

            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
Widget togglePassword (){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword=!_isSecurePassword;
      });

    },
        icon: _isSecurePassword? const Icon(Icons.visibility):const Icon(Icons.visibility_off),
    color: kPrimaryColor,disabledColor: kPrimaryLightColor,);
}
}


