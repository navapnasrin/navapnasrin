import 'package:my_sap_app/db_helper/repository.dart';
import 'package:my_sap_app/model/bill_to_model.dart';

import '../model/bp_model.dart';

class BillToService
{
  late Repository _repository;
  BillToService(){
    _repository=Repository();
  }
  saveBillTo(BillAddModel bill) async {
    return await _repository.insertData('billTo', bill.billAddMap());
  }

  readAllBp() async
  {
    return await _repository.readData("billTo");
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

  deleteBillTo(billId)async{
    return await  _repository.deleteDataById("billTo", billId);

  }

  updateBillTo(BillAddModel bill) async {
    //print('billId is ${bill.billId}');
    return await _repository.updateData('billTo', bill.billAddMap(),bill.billId);

  }

readBillInfoById(bpId)async{
    //print(bpId);
  return await _repository.readBillInfoByID("billTo","b_id", bpId);
}

}

