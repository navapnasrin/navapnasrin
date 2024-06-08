import 'package:azlistview/azlistview.dart';

class ContactAlphabet extends ISuspensionBean{

  ContactAlphabet({ required this.title,required this.tag});

  final String title;
  final String tag;
  @override
  String getSuspensionTag() {
    // TODO: implement getSuspensionTag
    throw UnimplementedError();
  }


}