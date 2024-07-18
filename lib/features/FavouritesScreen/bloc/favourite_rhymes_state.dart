part of 'favourite_rhymes_bloc.dart';

sealed class FavouriteRhymesState extends Equatable{}

class FavouriteRhymesInitial extends FavouriteRhymesState{
  @override
  List<Object?> get props => [];
}

class FavouriteRhymesLoading extends FavouriteRhymesState{

  @override
  List<Object?> get props => [];
}

class FavouriteRhymesLoaded extends FavouriteRhymesState{

  FavouriteRhymesLoaded({required this.favouriteRhymes});

  final List<FavouriteRhymes> favouriteRhymes;

  @override
  List<Object?> get props => [favouriteRhymes,];
}

class FavouriteRhymesFailure extends FavouriteRhymesState{

  FavouriteRhymesFailure({required this.error});

  final Object error;

  @override
  List<Object?> get props => [error,];
}