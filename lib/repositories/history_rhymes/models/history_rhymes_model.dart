import 'package:realm/realm.dart';

part 'history_rhymes_model.realm.dart';

@RealmModel()
class _HistoryRhymes{
  @PrimaryKey()
  late String id;
  late String word;
  late List<String> words;
}

