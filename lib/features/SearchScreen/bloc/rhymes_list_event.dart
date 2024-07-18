part of 'rhymes_list_bloc.dart';

sealed class RhymesEvent extends Equatable{}

class RhymesListEvent extends RhymesEvent{

  RhymesListEvent({required this.query});

  final String query;

  @override
  List<Object?> get props => [query];

}

class ToggleFavouriteEvent extends RhymesEvent{

  ToggleFavouriteEvent(
    this.completer, {
    this.rhymes,
    required this.id,
    required this.word,
    required this.favouriteWord,
  });

  final Rhymes? rhymes;
  final int id;
  final String word;
  final String favouriteWord;
  final Completer? completer;

  @override
  List<Object?> get props => [rhymes, word, favouriteWord, completer];
}