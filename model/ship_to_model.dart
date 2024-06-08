
class ShipAdd {
  int? shipId;
  int? sId;
  String? name;
  String? country;
  String? state;
  String? city;
  String? street;
  String? postalCode;

  shipAddMap() {
    var mapping = <String, dynamic>{};
    mapping['name'] = name ?? " ";
    mapping['country'] = country;
    mapping['state'] = state;
    mapping['city'] = city;
    mapping['street'] = street ?? " ";
    mapping['postalCode'] = postalCode ?? " ";
    mapping['sId']=sId??"";

    return mapping;
  }
}