import 'package:my_sap_app/db_helper/repository.dart';

import '../model/contact_model.dart';

class BpContactService
{
  late Repository _repository;
  BpContactService(){
    _repository=Repository();
  }
  saveBp(ContactInfo contactInfo) async
  {
    return await _repository.insertData('bpContactInfo', contactInfo.bpMap());
  }
  readAllBp() async
  {
    return await _repository.readData("bpContactInfo");
  }

  readContactInfoByID(bpID) async {
    return await _repository.readContactInfoByID("bpContactInfo","bpId", bpID);
  }



  deleteBp(contactId)async{
    return await  _repository.deleteDataById("bpContactInfo", contactId);

  }

  updateBp(ContactInfo contactInfo) async {
    return await _repository.updateData('bpContactInfo', contactInfo.bpMap(),contactInfo.contactId);
  }


}