
import 'package:my_sap_app/db_helper/db_connection.dart';
import 'package:my_sap_app/services/bp_service.dart';
import 'package:sqflite/sqflite.dart';

import '../model/bp_model.dart';

class Repository {

  late DbConnection _dbConnection;
   late String bpn = "";

  Repository() {
    _dbConnection = DbConnection();
  }

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _dbConnection.setDataBase();
      return _database;
    }
  }

  //insert data

  insertData(table, data) async {
    final connection = await database;
    return await connection?.insert(table, data);
  }

  //Read All bp

  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  // Read single bp
  readDataById(table, itemId) async {
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  //read data from bpType  customer
  readBpTypeByCustomer(table, bpType, value) async {
    var connection = await database;
    return await connection?.query(
        table, where: 'bpType=?', whereArgs: [value]);
  }

  //read data from bpType Vendor
  readBpTypeByVendor(table, bpType, value) async {
    var connection = await database;
    return await connection?.query(
        table, where: 'bpType=?', whereArgs: [value]);
  }

  //read data from bpType Lead

  readBpTypeByLead(table, bpType, value) async {
    var connection = await database;
    return await connection?.query(
        table, where: 'bpType=?', whereArgs: [value]);
  }

  readContactInfoByID(table, bpId, value) async {
    //print('cnt bpid =$bpId');
    var connection = await database;
    return await connection?.query(table, where: 'bpId=?', whereArgs: [value]);
  }

  //Update Data
  updateData(table, data, id) async {
    //print('billId repository is $id}');
    var connection = await database;
    return await connection?.
    update(table, data, where: 'id=?', whereArgs: [id]);
  }

  // Delete Data

  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }

 /*Future<String> selectDataById(table, itemId) async {
    var connection = await database;
  //Future<List> fl= (await connection?.rawQuery("select * from $table where id=$itemId")) as Future<List>;
    Future<List> fl= (await connection?.query(table, where: 'id=?', whereArgs: [itemId]))  as Future<List>;

    List l=fl as List;
  String n=l[2];
  print('n is $n');
  return n;
  }*/

  readBpNameById(table, itemId) async {
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }


  readNameById(id) async {
    var bpService = BpService();

    var bpInfo = await bpService.readAllBp();
    bpInfo.forEach((bpMap) {
      var bpModel = Bp();
      bpModel.id = bpMap["id"];

      try {
        if (bpModel.id == id) {
          bpn = bpMap["name"];
        }
      }
      on Exception catch (_, e) {}
    });
     print('name is $bpn');
    return bpn;
  }

  readBillInfoByID(table, b_id, value) async {
    //print('b_id = $value');
    var connection = await database;
    return await connection?.query(table, where: 'b_id=?', whereArgs: [value]);
  }



  readShipInfoByID(table, sId, value) async {
    //print('b_id = $value');
    var connection = await database;
    return await connection?.query(table, where: 'sId=?', whereArgs: [value]);
  }


}