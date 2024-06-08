import 'package:my_sap_app/db_helper/repository.dart';
import 'package:my_sap_app/model/bill_to_model.dart';

import '../model/bp_model.dart';
import '../model/ship_to_model.dart';

class ShipToService
{
  late Repository _repository;
  ShipToService(){
    _repository=Repository();
  }
  saveShipTo(ShipAdd shipAdd) async
  {
    return await _repository.insertData('shipTo', shipAdd.shipAddMap());
  }
  readAllBp() async
  {
    return await _repository.readData("shipTo");
  }


  deleteShipTo(shipId)async{
    return await  _repository.deleteDataById("shipTo", shipId);

  }

  updateShipTo(ShipAdd shipAdd) async {
    return await _repository.updateData('shipTo', shipAdd.shipAddMap(),shipAdd.shipId);
  }

  readShipInfoById(sid)async{
    print(sid);
    return await _repository.readShipInfoByID("shipTo","sId", sid);
  }


}

