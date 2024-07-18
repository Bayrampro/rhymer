import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/rhymes_list_bloc.dart';

class SearchFailure extends StatelessWidget {
  const SearchFailure({Key? key, required this.searchController, required this.error}) : super(key: key);

  final TextEditingController searchController;
  final String error;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Oops, something went wrong...',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
            Text(
              'Please try again',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10,),
            IconButton(
                onPressed: (){
                  BlocProvider.of<RhymesListBloc>(context).add(RhymesListEvent(query: searchController.text));
                },
                icon: Icon(
                  Icons.refresh,
                  size: 38,
                )
            )
          ],
        ),
      ),
    );
  }
}