import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/repositories/history_rhymes/history_rhymes.dart';

part 'history_rhymes_event.dart';
part 'history_rhymes_state.dart';

class HistoryRhymesBloc extends Bloc<HistoryRhymesEvent, HistoryRhymesState> {
  HistoryRhymesBloc({required this.historyRhymesRepository}) : super(HistoryRhymesInitial()){

    on<HistoryRhymesLoad>((event, emit) async{
      try {
        emit(HistoryRhymesLoading());
        final historyRhymes = await historyRhymesRepository.getRhymesList();
        emit(HistoryRhymesLoaded(historyRhymes: historyRhymes));
      } catch (e) {
        emit(HistoryRhymesFailure(error: e));
      }
    });

    on<HistoryRhymesClear>((event, emit) async{
      try {
        await historyRhymesRepository.clear();
        add(HistoryRhymesLoad());
      } catch (e) {
        log(e.toString());
      }
    });

  }

  final HistoryRhymesInterface historyRhymesRepository;

}