import 'models/models.dart';

abstract interface class FavouriteRhymesInterface{
  Future<List<FavouriteRhymes>> getRhymesList();
  Future<void> createOrDelete(FavouriteRhymes rhyme);
  Future<void> clear();
}