import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/features/HistoryScreen/bloc/history_rhymes_bloc.dart';
import 'package:rhymer/ui/ui.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  @override
  void initState() {
    BlocProvider.of<HistoryRhymesBloc>(context).add(HistoryRhymesLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          title: Text('History'),
          centerTitle: true,
          backgroundColor: Theme.of(context).canvasColor,
          surfaceTintColor: Colors.transparent,
        ),
        SliverToBoxAdapter(child: SizedBox(height: 5,),),
        BlocBuilder<HistoryRhymesBloc, HistoryRhymesState>(
            builder: (context, state) {
              if(state is HistoryRhymesLoaded){
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1.6,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index){
                      return RhymeHistoryCard(
                        rhymes: state.historyRhymes[index].words,
                        word: state.historyRhymes[index].word,
                      );
                    },
                    childCount: state.historyRhymes.length,
                  ),
                );
              }
              return SizedBox();
            }
        )
      ],
    );
  }
}
