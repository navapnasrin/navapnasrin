import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class CustomSearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSearchAppbar({super.key,
    required this.text,
    this.svg,
    this.action,
    required this.icon});

  final Title text;
  final SvgPicture? svg;
  final List<Widget>? action;
  final IconButton icon;


  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 80.0,
        backgroundColor:kPrimaryColor,

        leading:Stack(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: icon        ),
            Padding(
              padding:  const EdgeInsets.all(10.0),
              child: svg,
            ),

          ],
        ),
        titleSpacing:20.0,
        //centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text as String,
            style: const TextStyle(color:appBarColor,
              fontWeight: FontWeight.bold,fontSize: 23.0,),
            textAlign:TextAlign.center,
          ),
        ),
        actions:action,

        //IconButton(
        // onPressed: (){},
        // icon:const Icon(Icons.more_vert_outlined,color:appBarColor,size: 35.0,),
        //iconButton!,
        // popupMenuButton!,

      ),

    );
  }
}
