import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/repositories/favourite_rhymes/favourite_rhymes.dart';
import 'package:rhymer/repositories/favourite_rhymes/models/models.dart';
part 'favourite_rhymes_event.dart';
part 'favourite_rhymes_state.dart';

class FavouriteRhymesBloc extends Bloc<FavouriteRhymesEvent, FavouriteRhymesState> {
  FavouriteRhymesBloc({required this.favouriteRhymesRepository}) : super(FavouriteRhymesInitial()){

    on<LoadFavouriteRhymes>((event, emit) async{
      try {
        emit(FavouriteRhymesLoading());
        final favouriteRhymes = await favouriteRhymesRepository.getRhymesList();
        emit(FavouriteRhymesLoaded(favouriteRhymes: favouriteRhymes));
      } catch (e) {
        emit(FavouriteRhymesFailure(error: e));
      }
    });
  }

  final FavouriteRhymesInterface favouriteRhymesRepository;
}