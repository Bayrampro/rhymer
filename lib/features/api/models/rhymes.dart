import 'package:json_annotation/json_annotation.dart';

part 'rhymes.g.dart';

@JsonSerializable()
class Rhymes {
  const Rhymes({required this.word, required this.id,});

  factory Rhymes.fromJson(Map<String, dynamic> json) => _$RhymesFromJson(json);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'word')
  final String word;

  Map<String, dynamic> toJson() => _$RhymesToJson(this);
}