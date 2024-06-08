import 'package:flutter/material.dart';

import '../constants.dart';

class CustomMoreField extends StatelessWidget {
  const CustomMoreField({
    super.key,
    required this.onPress, required this.title});

  final Function onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.11,
      child: GestureDetector(
        onTap: onPress as void Function()?,
        child:  Card(
          color: Colors.white60,
          shape: const RoundedRectangleBorder(
            borderRadius:BorderRadius.zero,
          ),
          elevation: 1,
          child: Padding(
            padding:const EdgeInsets.all(2.0),

            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios_outlined,
                  color: kPrimaryColor,
                  size:20.0),
              title: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(title,
                      style: const TextStyle(color:kPrimaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),

      ),
    );
  }
}
