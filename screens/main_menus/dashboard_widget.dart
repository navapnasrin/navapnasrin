import 'package:flutter/material.dart';
class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key,
    required this.title,
    required this.icon,
    required this.onPress});

  final String title;
  final Icon icon;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
           Text(title,
        style: const TextStyle(color: Colors.indigo,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
            IconButton(
                onPressed:onPress as void Function(),
                icon:const  Icon(Icons.arrow_forward_ios_outlined,
                    color: Colors.indigo,
                    size:20.0)),

    ],
      ),
    );
  }

}
