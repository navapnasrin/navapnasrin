import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sap_app/constants.dart';
class DashboardMenu extends StatelessWidget {
  const DashboardMenu({super.key,
    required this.title,
    required this.assetName,
    required this.onPress});

  final String title;
  final  SvgPicture assetName;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.12,
      child: GestureDetector(
        onTap: onPress as void Function(),
        child: Card(
          color: Colors.white60,
          shape: const RoundedRectangleBorder(
            borderRadius:BorderRadius.zero,
          ),
          elevation: 1,
          child: Padding(
            padding:const  EdgeInsets.only(top: 6.0),
            child: ListTile(
              leading: assetName,
              trailing:const  Icon(Icons.arrow_forward_ios_outlined,
                  color: kPrimaryColor,
                  size:20.0),
              title: Text(title,
                //textAlign: TextAlign.center,
                style: const TextStyle(color:kPrimaryColor,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
