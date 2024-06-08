import '../db_helper/repository.dart';
import '../model/activity_model.dart';

class ActService{
  late Repository _repository;
  ActService(){
    _repository=Repository();
  }
  saveBp(ActivityModel actModel) async
  {
    return await _repository.insertData('activity', actModel.activityMap());
  }
  readAllBp() async
  {
    return await _repository.readData("activity");
  }
}