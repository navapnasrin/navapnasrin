import 'package:flutter/material.dart';
import 'package:my_sap_app/widgets/custom_button.dart';
import 'package:my_sap_app/widgets/custom_text_form.dart';

import '../../widgets/already_have_an_account_acheck.dart';
import '../../constants.dart';
import '../login/login_screen.dart';
class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);


  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formkey=GlobalKey<FormState>();
  TextEditingController usernameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool _isSecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.80,
      height: MediaQuery.of(context).size.height,
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            /*TextFormField(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          cursorColor: kPrimaryColor,
          onSaved: (email) {},
          decoration: const InputDecoration(
            hintText: "Your Name",
            prefixIcon: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Icon(Icons.person),
            ),
          ),
        ),
            TextFormField(
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
                //hintText: 'Username',
                controller: usernameController,
                isObscure: false,
                label: 'UserName',
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter username";
                  }else if(value.length<4){
                    return"Enter valid Username";
                  }return null;
                },
                keyboardType: TextInputType.text,
              prefixIcon: const Icon(Icons.person),
                ),
            const SizedBox(height: defaultPadding),

            CustomTextFormField(
              //hintText: 'Enter Email Adderss',
              controller: emailController,
              isObscure: false,
              label: 'Email Address',
              validator: (value){
                if(value!.isEmpty){
                  return "Please enter your email adderss";
                }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)){
                  return"Invalid email address";
                }return null;
              },
              keyboardType: TextInputType.text,
              prefixIcon: const Icon(Icons.email),

            ),
            const SizedBox(height: defaultPadding),
            CustomTextFormField(
              controller: passwordController,
              isObscure:false,
              label: 'Password',
              validator: (value){
                if(value!.isEmpty){
                  return "Please enter password";
                }return null;
              },
              keyboardType: TextInputType.text,
              prefixIcon: const Icon(Icons.lock),

            ),

            const SizedBox(height: defaultPadding),

            CustomTextFormField(
              //hintText: 'Confirm Password',
              isObscure: _isSecurePassword,
              label: 'Confirm Password',
              validator: (value){
                if(value!.isEmpty){
                  return "Please re-enter password";
                }else if(value!=passwordController.text){
                  return "Password MissMatch";
                }
                return null;
              },
              keyboardType: TextInputType.text,
              suffixIcon:togglePassword(),
              prefixIcon: const Icon(Icons.lock),

            ),
            const SizedBox(height: defaultPadding/1.5),

            CustomButton(
              onPress:(){
              if (_formkey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Registration Success full'),
                  ),
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }
                ),
                );
              }
              },
              btnText:"sign up".toUpperCase(),
                  ),

            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
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