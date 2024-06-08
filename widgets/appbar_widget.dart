import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sap_app/constants.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppbarWidget({super.key, this.icon, required this.text, required this.btn, required this.image});
  final SvgPicture? icon;
  final String text;
  final IconButton btn;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _appBar(context),
    );
  }
  PreferredSize _appBar(context){
    return PreferredSize(preferredSize: const Size.fromHeight(90.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.25,
          decoration: _boxDecoration(),
    child:  SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Image(image:image,
              width:MediaQuery.of(context).size.width*0.2,
              height: MediaQuery.of(context).size.height*0.3,

            ),
            Text(text,style:const TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,color: Colors.white70),
              textAlign: TextAlign.center,),
            btn
          ],
        ),
      ),
    ),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size.fromHeight(90.0);
}
BoxDecoration _boxDecoration(){
  return const BoxDecoration(
    color: kPrimaryColor,
  );
}