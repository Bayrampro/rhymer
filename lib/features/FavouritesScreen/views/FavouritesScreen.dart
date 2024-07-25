import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/features/FavouritesScreen/bloc/favourite_rhymes_bloc.dart';

import '../../../ui/ui.dart';
import '../../SearchScreen/bloc/rhymes_list_bloc.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  void initState() {
    BlocProvider.of<FavouriteRhymesBloc>(context).add(LoadFavouriteRhymes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          title: const Text('Favourites'),
          centerTitle: true,
          backgroundColor: Theme.of(context).canvasColor,
          surfaceTintColor: Colors.transparent,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 5,
          ),
        ),
        BlocBuilder<FavouriteRhymesBloc, FavouriteRhymesState>(
            builder: (context, state) {
          if (state is FavouriteRhymesLoaded) {
            return SliverList.builder(
                itemCount: state.favouriteRhymes.length,
                itemBuilder: (context, index) => RhymeList(
                      isFavourite: true,
                      rhyme: state.favouriteRhymes[index].favouriteWord,
                      sourceWord: state.favouriteRhymes[index].word,
                      onTap: () async {
                        final completer = Completer();
                        final toggleBloc =
                            BlocProvider.of<RhymesListBloc>(context);
                        final favouriteBloc =
                            BlocProvider.of<FavouriteRhymesBloc>(context);
                        toggleBloc.add(ToggleFavouriteEvent(
                          completer,
                          id: state.favouriteRhymes[index].id,
                          word: state.favouriteRhymes[index].word,
                          favouriteWord:
                              state.favouriteRhymes[index].favouriteWord,
                        ));
                        await completer.future;
                        favouriteBloc.add(LoadFavouriteRhymes());
                      },
                    ));
          }
          return const SliverFillRemaining(
            child: CircularProgressIndicator(),
          );
        }),
      ],
    );
  }
}
