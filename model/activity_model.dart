class ActivityModel{

  int? aId;
  String? activity;
  String? bp;
  String? contact;
  String? type;
  String? subject;
  String? linkTo;
  String? remark;
  String? content;
  String? handledBy;
  int? sTime;
  int? eTime;
  String? more;

  activityMap(){
    final mapping =<String,dynamic>{};
    mapping["activity"]=activity??"";
    mapping["bp"]=bp??"";
    mapping["contact"]=contact??"";
    mapping["type"]=type??"";
    mapping["subject"]=subject??"";
    mapping["linkTo"]=linkTo??"";
    mapping["remark"]=remark??"";
    mapping["content"]=content??"";
    mapping["handledBy"]=handledBy??"";
    mapping["sTime"]=sTime??"";
    mapping["eTime"]=eTime??"";
    mapping["more"]=more??"";

    return mapping;
  }

}