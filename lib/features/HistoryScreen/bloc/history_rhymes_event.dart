part of 'history_rhymes_bloc.dart';

sealed class HistoryRhymesEvent extends Equatable {

}

final class HistoryRhymesLoad extends HistoryRhymesEvent{

  @override
  List<Object?> get props => [];
}

final class HistoryRhymesClear extends HistoryRhymesEvent{

@override
List<Object?> get props => [];
}