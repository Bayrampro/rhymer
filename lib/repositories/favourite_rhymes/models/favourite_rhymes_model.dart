import 'package:realm/realm.dart';

part 'favourite_rhymes_model.realm.dart';

@RealmModel()
class _FavouriteRhymes{
  @PrimaryKey()
  late int id;
  late DateTime createdAt;
  late List<String> words;
  late String word;
  late String favouriteWord;
}