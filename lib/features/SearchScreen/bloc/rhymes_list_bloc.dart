import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/features/api/api.dart';
import 'package:equatable/equatable.dart';
import 'package:rhymer/repositories/favourite_rhymes/favourite_rhymes.dart';
import 'package:rhymer/repositories/history_rhymes/history_rhymes.dart';
import 'package:uuid/uuid.dart';

import '../../api/models/models.dart';

part 'rhymes_list_event.dart';
part 'rhymes_list_state.dart';

class RhymesListBloc extends Bloc<RhymesEvent, RhymesState> {
  RhymesListBloc({
    required this.apiClient,
    required this.historyRhymesRepository,
    required this.favouriteRhymesRepository,
  }) : super(RhymesInitial()){

    on<RhymesListEvent>((event, emit) async{

      try {
        emit(RhymesLoading());
        final rhymes = await apiClient.getRhymes(event.query);
        List<String> words = rhymes.map((rhyme) => rhyme.word).toList();
        final historyRhymes = HistoryRhymes(Uuid().v4().toString(), event.query, words: words);
        historyRhymesRepository.setRhymes(historyRhymes);
        final favouriteRhymes = await favouriteRhymesRepository.getRhymesList();
        emit(
            RhymesLoaded(
            rhymesList: rhymes,
            queryWord: event.query,
            favouriteRhymes: favouriteRhymes
        ));
      } catch (e, st) {
        emit(RhymesFailure(error: e));
        log(e.toString(), stackTrace: st);
      }

    });

    on<ToggleFavouriteEvent>((event, emit) async{

      try {
        final prevState = state;
        if(prevState is! RhymesLoaded && prevState is! RhymesInitial){
          log('State not loaded');
          return;
        }
        final rhymes = await apiClient.getRhymes(event.word);
        List<String> words = rhymes.map((rhyme) => rhyme.word).toList();
        final favRhyme = FavouriteRhymes(event.id, DateTime.now(), event.word, event.favouriteWord, words: words);
        favouriteRhymesRepository.createOrDelete(favRhyme);
        await favouriteRhymesRepository.getRhymesList();
        final favouriteRhymesAll = await favouriteRhymesRepository.getRhymesList();
        if(prevState is RhymesLoaded){
          emit(prevState.copyWith(favouriteRhymes: favouriteRhymesAll));
        }
      } catch (e) {
        emit(RhymesFailure(error: e));
      } finally{
        event.completer?.complete();
      }

    });
  }

  final RhymesApiClient apiClient;
  final HistoryRhymesInterface historyRhymesRepository;
  final FavouriteRhymesInterface favouriteRhymesRepository;
}