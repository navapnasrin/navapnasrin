
class BillAddModel {
  int? billId;
   int? b_id;
  String? billName;
  String? country;
  String? state;
  String? city;
  String? street;
  String? postalCode;

  billAddMap() {
    var mapping = <String, dynamic>{};
    mapping['billName'] = billName ?? " ";
    mapping['country'] = country;
    mapping['state'] = state;
    mapping['city'] = city;
    mapping['street'] = street ?? " ";
    mapping['postalCode'] = postalCode ?? " ";
    mapping['b_id']= b_id ?? "";

    return mapping;
  }
}