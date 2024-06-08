import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_sap_app/constants.dart';
class CountryPicker extends StatefulWidget {
  const CountryPicker({super.key});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}


 String? selectCountry="";
 String? selectState="";
 String? selectCity="";

class _CountryPickerState extends State<CountryPicker> {

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.27,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CSCPicker(
            layout: Layout.vertical,
            onCityChanged: (city){
              setState(() {
                selectCity=city;
              });
            },
            onCountryChanged: (country){
              setState(() {
                selectCountry=country;
              });
            },
            onStateChanged: (state){
              setState(() {
                selectState=state;
              });
            },

            countrySearchPlaceholder: "Country",
            stateSearchPlaceholder: "State",
            citySearchPlaceholder: "City",

            countryDropdownLabel: "Country/Region",
            cityDropdownLabel: "Select City",
            stateDropdownLabel: "Select State",


            dropdownDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10.0),
              ),
              border: Border.all(color: Colors.black54,width:2.0)
            ),

            disabledDropdownDecoration:BoxDecoration(
                color: Colors.white10
                ,
                borderRadius: const BorderRadius.all(Radius.circular(10.0),
                ),
                border: Border.all(color: Colors.black54,width:2.0)
            ),

              dropdownHeadingStyle:const TextStyle(
                color: kPrimaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),

            selectedItemStyle:const TextStyle(
                color: kPrimaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold) ,

            dropdownItemStyle: const TextStyle(
                color: kPrimaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),



          ),
        ),


    );
  }
}
