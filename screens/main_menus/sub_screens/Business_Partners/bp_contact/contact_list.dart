import 'dart:async';
import 'dart:convert';
import 'dart:typed_data' as td;

import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_sap_app/model/bp_model.dart';
//import 'package:my_sap_app/model/contactInfo_model.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact/bp_contact.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/bp_contact_fields.dart';
import 'package:my_sap_app/screens/main_menus/sub_screens/Business_Partners/custom_bpButton.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../constants.dart';
import '../../../../../widgets/custom_appbar.dart';


class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}
 String? name;

 String? number;


class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: "Contact List",
        icon: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: appBarColor,
            size: 20.0,
          ),
        ),

        //svg:SvgPicture.asset('assets/images/business_partners.svg',
        // color: appBarColor,),
      ),
      body:  SizedBox(
      height: double.infinity,
      child: FutureBuilder(
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: SizedBox(
                height: 20.0,
                width: 20.0,
                child: CircularProgressIndicator(),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,

            itemBuilder: (BuildContext context, index) {
              Contact contact = snapshot.data[index];

             // print(snapshot.data[index]);
              return Column(
                children: [
                  ListTile(
                    onTap: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => _ContactDetailsPage(
                                  contactId: contact.id,
                              )));},

                    leading:  _ContactImage(
                      contact: contact,

                    ),
                    title: Text(contact.displayName,
                      style: const TextStyle(color:kPrimaryColor,
                      fontSize: 20.0),),



                  ),
                  const Divider(),

                ],
              );

            },
          );
        },
        future: getContacts(),
      ),
      ),
    );
  }

  Future<Object?> getContacts() async {
    bool isGranted = await Permission.contacts.status.isGranted;
    if (!isGranted) {
      isGranted = await Permission.contacts.request().isGranted;
    }
    if (isGranted) {

      return await FastContacts.getAllContacts();
      //return await FastContacts.getContactImage(contact.Id);

    }
    return [];
  }
}

class _ContactImage extends StatefulWidget {
  const _ContactImage({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final Contact contact;

  @override
  __ContactImageState createState() => __ContactImageState();
}

class __ContactImageState extends State<_ContactImage> {
  late Future<td.Uint8List?> _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = FastContacts.getContactImage(widget.contact.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<td.Uint8List?>(
      future: _imageFuture,
      builder: (context, snapshot) => SizedBox(
        width: 56,
        height: 56,
        child: snapshot.hasData
            ? Image.memory(snapshot.data!, gaplessPlayback: true)
            : const Icon(Icons.account_box_rounded,size: 40.0,),
      ),
    );
  }
}

class _ContactDetailsPage extends StatefulWidget {
  const _ContactDetailsPage({
    Key? key,
    required this.contactId,
  }) : super(key: key);

  final String contactId;

  @override
  State<_ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<_ContactDetailsPage> {
  late Future<Contact?> _contactFuture;

  Duration? _timeTaken;

  @override
  void initState() {
    super.initState();
    final sw = Stopwatch()..start();
    _contactFuture = FastContacts.getContact(widget.contactId).then((value) {
      _timeTaken = (sw..stop()).elapsed;
      return value;

          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact details: ${widget.contactId}'),
      ),
      body: FutureBuilder<Contact?>(
        future: _contactFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final error = snapshot.error;
          if (error != null) {
            return Center(child: Text('Error: $error'));
          }

          final contact = snapshot.data;
          if (contact == null) {
            return const Center(child: Text('Contact not found'));
          }


          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ContactImage(contact: contact),
                  const SizedBox(height: 16),
                  if (_timeTaken != null)
                    Text('Took: ${_timeTaken!.inMilliseconds}ms'),
                  const SizedBox(height: 16),
                  Text("Name:${contact.displayName}",
                    style:const TextStyle(color:kPrimaryColor,
                      fontSize: 20.0,
                    )
                  ),
                  const SizedBox(
                    height: defaultPadding*2,
                  ),
                  Text("Number:${contact.phones[0].number}",
                      style:const TextStyle(color:kPrimaryColor,
                        fontSize: 20.0,
                      ),
                  ),
                  const SizedBox(
                    height: defaultPadding*2,
                  ),
                  CustomBpButton(
                      onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  const BpContact(

                                )))
              .then((value){
          setState(() {
          name=contact.displayName;
          number=contact.phones[0].number;
          });

                          });
                      },
                      text: "Add Bp List"
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
