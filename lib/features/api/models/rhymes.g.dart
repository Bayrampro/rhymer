// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rhymes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rhymes _$RhymesFromJson(Map<String, dynamic> json) => Rhymes(
      word: json['word'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$RhymesToJson(Rhymes instance) => <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
    };
