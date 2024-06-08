class ContactInfo{
  int? contactId;
  int? bpId;
  String? contactName;
  String? contactTitle;
  String? contactPosition;
  String? contactMobile;
  String? contactTelephone1;
  String? contactTelephone2;
  String? contactEmail;
  String? contactFax;

  bpMap(){
    var mapping =<String,dynamic>{};
    mapping['contactName']=contactName??" ";
    mapping['contactTitle']=contactTitle??" ";
    mapping['contactPosition']=contactPosition??" ";
    mapping['contactMobile']=contactMobile??" ";
    mapping['contactTelephone1']=contactTelephone1??" ";
    mapping['contactTelephone2']=contactTelephone2??" ";
    mapping['contactEmail']=contactEmail??" ";
    mapping['contactFax']=contactFax??" ";
    mapping['bpId']=bpId;

    return mapping;


  }

}