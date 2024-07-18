part of 'history_rhymes_bloc.dart';


sealed class HistoryRhymesState extends Equatable {

}

class HistoryRhymesInitial extends HistoryRhymesState{

  @override
  List<Object?> get props => [];
}

class HistoryRhymesLoading extends HistoryRhymesState{

  @override
  List<Object?> get props => [];
}

class HistoryRhymesLoaded extends HistoryRhymesState{

  HistoryRhymesLoaded({required this.historyRhymes});

  final List<HistoryRhymes> historyRhymes;

  @override
  List<Object?> get props => [historyRhymes,];
}

class HistoryRhymesFailure extends HistoryRhymesState{

  HistoryRhymesFailure({required this.error});

  final Object error;

  @override
  List<Object?> get props => [error,];
}