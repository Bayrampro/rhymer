part of 'rhymes_list_bloc.dart';

sealed class RhymesState extends Equatable{}

class RhymesInitial extends RhymesState{
  @override
  List<Object?> get props => [];
}

class RhymesLoading extends RhymesState{

  @override
  List<Object?> get props => [];
}

class RhymesLoaded extends RhymesState{

  RhymesLoaded({
    required this.rhymesList,
    required this.queryWord,
    required this.favouriteRhymes,
  });

  final List<Rhymes> rhymesList;
  final String queryWord;
  final List<FavouriteRhymes> favouriteRhymes;

  bool isFavourite(String favouriteWord) {
    return favouriteRhymes.where((e) => e.word == queryWord && e.favouriteWord == favouriteWord).isNotEmpty;
  }

  @override
  List<Object?> get props => [rhymesList, queryWord, favouriteRhymes];

  RhymesLoaded copyWith(
      {
        String? queryWord,
        final List<Rhymes>? rhymesList,
        List<FavouriteRhymes>? favouriteRhymes,
      }
  ){
    return RhymesLoaded(
        rhymesList: rhymesList ?? this.rhymesList,
        queryWord: queryWord ?? this.queryWord,
        favouriteRhymes: favouriteRhymes ?? this.favouriteRhymes
    );
  }
}


class RhymesFailure extends RhymesState{

  RhymesFailure({required this.error});

  final Object error;

  @override
  List<Object?> get props => [];
}