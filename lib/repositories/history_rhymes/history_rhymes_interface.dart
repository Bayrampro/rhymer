import 'models/models.dart';

abstract interface class HistoryRhymesInterface{
  Future<List<HistoryRhymes>> getRhymesList();
  Future<void> setRhymes(HistoryRhymes rhymes);
  Future<void> clear();
}