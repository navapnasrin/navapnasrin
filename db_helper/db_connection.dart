import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DbConnection {
  Future<Database> setDataBase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_bpInfo.db');
    var database = await openDatabase(path,
        version: 1,
        onCreate: _createDb,
        singleInstance: true,
        onConfigure: _onConfigure);
    return database;
  }

  Future _createDb(Database database, int version) async {

    String sql =  ''' CREATE TABLE bpInfo(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        code TEXT NOT NULL,
        name TEXT NOT NULL,
        telephone TEXT NOT NULL,
        email TEXT NOT NULL,
        webSite TEXT NOT NULL,
        bpType TEXT NOT NULL,
        salesEmployee TEXT NOT NULL,
        priceList TEXT NOT NULL
        )''';
    await database.execute(sql);

    String contact = '''CREATE TABLE  bpContactInfo(
        contactId INTEGER PRIMARY KEY AUTOINCREMENT,
        contactName TEXT NOT NULL,
        contactTitle TEXT NOT NULL,
        contactPosition TEXT NOT NULL,
        contactMobile TEXT NOT NULL,
        contactTelephone1 TEXT NOT NULL,
        contactTelephone2 TEXT NOT NULL,
        contactEmail TEXT NOT NULL,
        contactFax TEXT NOT NULL,
        bpId INTEGER NOT NULL,
        FOREIGN KEY (bpId) REFERENCES bpInfo
         (id)                  
           ON DELETE CASCADE ON UPDATE CASCADE

         )''';


    await database.execute(contact);

    String billAddress= '''CREATE TABLE billTo(
    billId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    billName TEXT NOT NULL,
    country TEXT NOT NULL,
    state TEXT NOT NULL,
    city TEXT NOT NULL,
    street TEXT NOT NULL,
    postalCode TEXT NOT NULL,
    b_id INTEGER NOT NULL
    )''';

    await database.execute(billAddress);

    String shipAddress= '''CREATE TABLE shipTo(
    shipId INTEGER
     PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    country TEXT NOT NULL,
    state TEXT NOT NULL,
    city TEXT NOT NULL,
    street TEXT NOT NULL,
    postalCode TEXT NOT NULL,
    sId INTEGER NOT NULL

    )''';

    await database.execute(shipAddress);

    String activity=''' CREATE TABLE activity(
    aId INTEGER
     PRIMARY KEY AUTOINCREMENT,
     activity TEXT NOT NULL,
     bp TEXT NOT NULL,
     contact TEXT NOT NULL,
     type TEXT,
     subject TEXT,
     linkTo TEXT,
     remark TEXT,
     content TEXT,
     handledBy TEXT NOT NULL,
     sTime INTEGER,
     eTime INTEGER,
     more Text
     
    
    )''';


  }

  _onConfigure(Database database) async {
    await database.execute("PRAGMA foreign_key = ON");
  }



}
