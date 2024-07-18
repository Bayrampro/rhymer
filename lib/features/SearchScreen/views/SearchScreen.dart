
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/features/FavouritesScreen/bloc/favourite_rhymes_bloc.dart';
import 'package:rhymer/features/HistoryScreen/bloc/history_rhymes_bloc.dart';
import 'package:rhymer/features/SearchScreen/bloc/rhymes_list_bloc.dart';

import '../../../ui/ui.dart';
import 'Widgets.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _searchController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<HistoryRhymesBloc>(context).add(HistoryRhymesLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          pinned: true,
          title: Text('Rhymer'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).canvasColor,
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                hintText: 'Start to type words...',
                                hintStyle: TextStyle(
                                  color: theme.hintColor.withOpacity(0.5),
                                )
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: theme.hintColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          final bloc = BlocProvider.of<RhymesListBloc>(context);
                          final query = _searchController.text;
                          bloc.add(RhymesListEvent(query: query));
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(Icons.search, color: Colors.white,),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7.0,)
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 5,),),
        SliverToBoxAdapter(
          child: RhymeHistoryList(),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 5,),),
        BlocConsumer<RhymesListBloc, RhymesState>(
            listener: (context, state){
              if(state is RhymesLoaded){
                BlocProvider.of<HistoryRhymesBloc>(context).add(HistoryRhymesLoad());
              }
            },
            builder: (context, state) {
              if(state is RhymesLoaded){
                final rhymes = state.rhymesList;
                return SliverList.builder(
                  itemCount: rhymes.length,
                  itemBuilder: (context, index) =>
                      RhymeList(
                        isFavourite: state.isFavourite(rhymes[index].word),
                        rhyme: rhymes[index].word,
                        onTap: () async {
                          final completer = Completer();
                          final toggleBloc = BlocProvider.of<RhymesListBloc>(context);
                          final favouriteBloc = BlocProvider.of<FavouriteRhymesBloc>(context);
                          toggleBloc.add(
                              ToggleFavouriteEvent(
                              completer,
                              rhymes: rhymes[index],
                              id: rhymes[index].id,
                              word: state.queryWord,
                              favouriteWord: rhymes[index].word,
                          )
                          );
                          await completer.future;
                          favouriteBloc.add(LoadFavouriteRhymes());
                        },
                      ),
                );
              }
              if(state is RhymesFailure){
                return SearchFailure(searchController: _searchController, error: state.error.toString(),);
              }
              if(state is RhymesInitial){
                return SearchInitial();
              }
              return SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
        ),
      ],
    );
  }
}
