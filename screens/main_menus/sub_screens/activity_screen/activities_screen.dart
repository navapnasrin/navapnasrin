import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_sap_app/screens/main_menus/main_menu.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/activity_screen/add_activity_feilds.dart';
import 'package:my_sap_app/widgets/custom_appbar.dart';

import '../../../../constants.dart';
import '../../popup_menu_items.dart';
import '../Business_Partners/add_bp.dart';
import 'add_activities_screen.dart';
class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}
bool enable = true;
var mCurrentIndex = 0;
var yCurrentIndex=0;
var year = [
  "2024",'2025','2026','2027','2028','2029','2030'
];
var month = [
  "January",
  "February",
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'];


class _ActivitiesState extends State<Activities> {

  final PageController _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    void changeMonth(){
      setState(() {
          if(mCurrentIndex>=0 && mCurrentIndex<11) {
          mCurrentIndex = mCurrentIndex+1;
        }
        else{
            yCurrentIndex=yCurrentIndex+1;
            mCurrentIndex=0;


        }


      });
    }

    void backClick(){
      setState(() {
        if( mCurrentIndex>0 && mCurrentIndex<=11) {
          mCurrentIndex = mCurrentIndex - 1;
        }
        else{
          yCurrentIndex=yCurrentIndex-1;
          mCurrentIndex=11;
        }
      });
    }








    return  Scaffold(
      appBar: CustomAppbar(
        text: 'Activities',

        action: [

          IconButton(
              onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>const AddActivities()));
              },
              icon: const Icon(Icons.add,
                color: appBarColor,
                size: 35.0,)),
        PopupMenuButton(itemBuilder: (BuildContext context){
          return PopupMenuItems.activityItems.map((String activityItems){
              return PopupMenuItem(
                height: MediaQuery.of(context).size.height*0.070,
                child:Text(activityItems),
              );
          }).toList();
        },
        icon:const Icon(Icons.more_vert,color: appBarColor,),
          //surfaceTintColor: appBarColor,
      ),


    ],
        icon:IconButton(
          onPressed:()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const MainMenuFields())),
    icon:const Icon(Icons.arrow_back_ios_new_outlined,color: appBarColor,size: 20.0,),),
          ),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.11,
              child: Padding(
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(onPressed: mCurrentIndex==0 && yCurrentIndex==0 ? null : (){
                        backClick();
                        setState(() {
                          if(mCurrentIndex==0 &&yCurrentIndex==0){
                            _pageController.animateToPage(
                                1,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);

                          }
                        });


              },
                          icon:  Icon(Icons.arrow_back_ios_new_rounded,
                          size: 30.0,
                             color: mCurrentIndex==0 && yCurrentIndex==0 ? Colors.black38:kPrimaryColor,


                          ),
                      disabledColor: Colors.white38,),
                     Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('${month[mCurrentIndex ]} ' ' ${year[yCurrentIndex]}',
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0
                        ),
                      ),
                    ),
                    IconButton(onPressed: (){
                      changeMonth();
                      setState(() {
                        if(mCurrentIndex==1 && yCurrentIndex==0){
                          _pageController.animateToPage(
                              2,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut);

                        }
                        else{
                          null;
                        }
                      });
                      //print(month[currentIndex]);

                    },
                        icon: const Icon(Icons.arrow_forward_ios,
                        size: 30.0,
                        color: kPrimaryColor,)),


                  ],
                ),
              ),
            ),

                SizedBox(

                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.70,
                  child: PageView(
                  controller: _pageController,
                  children:[

                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height*0.70,
                            child:const Card(
                              color: Colors.indigo,
                                child: Text("January")),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height*0.70,

                            child:const Text("February"),
                          ),




                        ],
                      ),
                ),
    ]
    )

    );

  }


}


class ChangeMonthActivities extends StatefulWidget {
  const ChangeMonthActivities({super.key});

  @override
  State<ChangeMonthActivities> createState() => _ChangeMonthActivitiesState();
}

class _ChangeMonthActivitiesState extends State<ChangeMonthActivities> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("january"),
    );
  }
}

