import 'package:realm/realm.dart';
import 'favourite_rhymes.dart';

class FavouriteRhymesRepository implements FavouriteRhymesInterface{

  FavouriteRhymesRepository({required this.realm});

  final Realm realm;

  @override
  Future<List<FavouriteRhymes>> getRhymesList() async{
    return realm.all<FavouriteRhymes>().toList();
  }

  @override
  Future<void> createOrDelete(FavouriteRhymes rhyme) async {
    realm.write(() {
      var existingRhyme = realm.find<FavouriteRhymes>(rhyme.id);
      if (existingRhyme != null) {
        realm.delete(existingRhyme);
        return;
      } else {
        realm.add(rhyme);
      }
    });
  }

  @override
  Future<void> clear() async{
    realm.write(() => realm.deleteAll<FavouriteRhymes>());
  }

}