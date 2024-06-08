import 'package:my_sap_app/db_helper/repository.dart';

import '../model/bp_model.dart';

class BpService
{
  late Repository _repository;
  BpService(){
    _repository=Repository();
  }
  saveBp(Bp bp) async
  {
    return await _repository.insertData('bpInfo', bp.bpMap());
  }
  readAllBp() async
  {
    return await _repository.readData("bpInfo");
  }
  readBpTypeByCustomer(bpType) async
  {
    return await _repository.readBpTypeByCustomer("bpInfo","bpType", 'Customer');
  }

  readBpTypeByVendor(bpType) async
  {
    return await _repository.readBpTypeByVendor("bpInfo", "bpType",'Vendor');
  }

  readBpTypeByLead(bpType) async
  {
    return await _repository.readBpTypeByLead("bpInfo","bpType", 'Lead');
  }

  deleteBp(bpId)async{
    return await  _repository.deleteDataById("bpInfo", bpId);

  }

   readNameById(bpId)async{
    print('id is :$bpId');
    return await  _repository.readNameById(bpId);

  }


  updateBp(Bp bp) async {
    print('bp id is ${bp.id}');
    return await _repository.updateData('bpInfo', bp.bpMap(),bp.id);
  }

}

