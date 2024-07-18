import 'package:realm/realm.dart';
import 'history_rhymes.dart';

class HistoryRhymesRepository implements HistoryRhymesInterface{

  HistoryRhymesRepository({
    required this.realm,
  });

  final Realm realm;

  @override
  Future<List<HistoryRhymes>> getRhymesList() async {
    final rhymes = realm.all<HistoryRhymes>().toList();
    return rhymes;
  }

  @override
  Future<void> setRhymes(rhymes) async {
    realm.write(() => realm.add(rhymes));
  }

  @override
  Future<void> clear() async {
    realm.write(() => realm.deleteAll<HistoryRhymes>());
  }

}