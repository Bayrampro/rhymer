part of 'favourite_rhymes_bloc.dart';

sealed class FavouriteRhymesEvent extends Equatable{}

class LoadFavouriteRhymes extends FavouriteRhymesEvent{
  @override
  List<Object?> get props => [];
}