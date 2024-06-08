


class Rbp{
  int? id;
  String? code;
  String? name;
  String? telephone;
  String? email;
  String? webSite;
  String? bpType;
  String? salesEmployee;
  String? priceList;



  rBpMap(){
    var mapping =<String,dynamic>{};
    mapping['id']=id??" ";
    mapping['code']=code?? " ";
    mapping['name']=name?? " ";
    mapping['telephone']=telephone?? " ";
    mapping['email']=email?? " ";
    mapping['webSite']=webSite?? " ";
    mapping['bpType']=bpType;
    mapping['salesEmployee']=salesEmployee;
    mapping['priceList']=priceList;


    return mapping;

  }

}
