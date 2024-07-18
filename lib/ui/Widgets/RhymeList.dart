
import 'package:flutter/material.dart';

class RhymeList extends StatefulWidget {
  const RhymeList({
    Key? key,
    required this.isFavourite,
    required this.rhyme,
    this.sourceWord,
    required this.onTap,
  }) : super(key: key);

  final bool isFavourite;
  final String rhyme;
  final String? sourceWord;
  final VoidCallback onTap;

  @override
  State<RhymeList> createState() => _RhymeListState();
}

class _RhymeListState extends State<RhymeList> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.only(left: 9),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if(widget.sourceWord != null)...[
                Text(widget.sourceWord!),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  ),
                ),
              ],
              Text(
                  widget.rhyme,
                  style: widget.isFavourite? theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600) : theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          IconButton(
              onPressed: widget.onTap,
              icon: widget.isFavourite? Icon(Icons.favorite) : Icon(Icons.favorite_border),
              color: widget.isFavourite? theme.primaryColor : theme.hintColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}