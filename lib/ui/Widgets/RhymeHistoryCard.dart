import 'package:flutter/material.dart';

class RhymeHistoryCard extends StatefulWidget {
  const RhymeHistoryCard({
    Key? key,
    required this.rhymes,
    required this.word
  }) : super(key: key);

  final List rhymes;
  final String word;

  @override
  State<RhymeHistoryCard> createState() => _RhymeHistoryCardState();
}

class _RhymeHistoryCardState extends State<RhymeHistoryCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      height: 70,
      width: 200,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.word,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18
              ),
            ),
            Flexible(
              child: Text(
                widget.rhymes.asMap().entries.map(
                   (e) {
                      final sb = StringBuffer();
                      sb.write(e.value);
                      if(e.key != widget.rhymes.length - 1){
                        sb.write(', ');
                      }
                      return sb.toString();
                    }
                ).join(),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }
}
