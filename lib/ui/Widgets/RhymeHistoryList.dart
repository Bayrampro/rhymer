
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/features/HistoryScreen/bloc/history_rhymes_bloc.dart';
import 'package:rhymer/ui/Widgets/RhymeHistoryCard.dart';

class RhymeHistoryList extends StatefulWidget {
  const RhymeHistoryList({Key? key}) : super(key: key);

  @override
  State<RhymeHistoryList> createState() => _RhymeHistoryCardState();
}

class _RhymeHistoryCardState extends State<RhymeHistoryList> {

  @override
  void initState() {
    BlocProvider.of<HistoryRhymesBloc>(context).add(HistoryRhymesLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: BlocBuilder<HistoryRhymesBloc, HistoryRhymesState>(
          builder: (context, state) {
            if(state is! HistoryRhymesLoaded) {
              return SizedBox();
            }
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                final rhymes = state.historyRhymes[i].words;
                return RhymeHistoryCard(rhymes: rhymes, word: state.historyRhymes[i].word,);
              },
              separatorBuilder: (context, i) => SizedBox(width: 5,),
              itemCount: state.historyRhymes.length,
            );
          }
      )
    );
  }
}