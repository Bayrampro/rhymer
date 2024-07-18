// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_rhymes_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FavouriteRhymes extends _FavouriteRhymes
    with RealmEntity, RealmObjectBase, RealmObject {
  FavouriteRhymes(
    int id,
    DateTime createdAt,
    String word,
    String favouriteWord, {
    Iterable<String> words = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set<RealmList<String>>(
        this, 'words', RealmList<String>(words));
    RealmObjectBase.set(this, 'word', word);
    RealmObjectBase.set(this, 'favouriteWord', favouriteWord);
  }

  FavouriteRhymes._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  RealmList<String> get words =>
      RealmObjectBase.get<String>(this, 'words') as RealmList<String>;
  @override
  set words(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get word => RealmObjectBase.get<String>(this, 'word') as String;
  @override
  set word(String value) => RealmObjectBase.set(this, 'word', value);

  @override
  String get favouriteWord =>
      RealmObjectBase.get<String>(this, 'favouriteWord') as String;
  @override
  set favouriteWord(String value) =>
      RealmObjectBase.set(this, 'favouriteWord', value);

  @override
  Stream<RealmObjectChanges<FavouriteRhymes>> get changes =>
      RealmObjectBase.getChanges<FavouriteRhymes>(this);

  @override
  Stream<RealmObjectChanges<FavouriteRhymes>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<FavouriteRhymes>(this, keyPaths);

  @override
  FavouriteRhymes freeze() =>
      RealmObjectBase.freezeObject<FavouriteRhymes>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'createdAt': createdAt.toEJson(),
      'words': words.toEJson(),
      'word': word.toEJson(),
      'favouriteWord': favouriteWord.toEJson(),
    };
  }

  static EJsonValue _toEJson(FavouriteRhymes value) => value.toEJson();
  static FavouriteRhymes _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'createdAt': EJsonValue createdAt,
        'words': EJsonValue words,
        'word': EJsonValue word,
        'favouriteWord': EJsonValue favouriteWord,
      } =>
        FavouriteRhymes(
          fromEJson(id),
          fromEJson(createdAt),
          fromEJson(word),
          fromEJson(favouriteWord),
          words: fromEJson(words),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(FavouriteRhymes._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, FavouriteRhymes, 'FavouriteRhymes', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('words', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('word', RealmPropertyType.string),
      SchemaProperty('favouriteWord', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
