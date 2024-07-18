import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/ui/theme/theme.dart';

import '../../../HistoryScreen/bloc/history_rhymes_bloc.dart';
import '../Widgets.dart';

class AlertWindow extends StatelessWidget {
  const AlertWindow({super.key});

  @override
  Widget build(BuildContext context) {

    void close(){
      Navigator.of(context).pop();
    }

    void confirm(){
      Navigator.of(context).pop();
      BlocProvider.of<HistoryRhymesBloc>(context).add(HistoryRhymesClear());
    }

    final theme = Theme.of(context);
    if(theme.isAndroid)
      return AlertDialog(
        surfaceTintColor: theme.cardColor,
        content: DialogContent(crossAxisAlignment: CrossAxisAlignment.start,),
        actions: [
          TextButton(
              onPressed: (){
                confirm();
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  color: theme.hintColor,
                ),
              )
          ),
          TextButton(
              onPressed: (){
                close();
              },
              child: Text(
                'No',
              )
          )
        ],
      );
    else
      return CupertinoAlertDialog(
        content: DialogContent(crossAxisAlignment: CrossAxisAlignment.center,),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: (){
              confirm();
            },
            child: Text(
              'Yes',
              style: TextStyle(
                color: theme.dangerActionColor,
              ),
            ),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: (){
              close();
            },
            child: Text(
              'No',
              style: TextStyle(
                color: Color(0xFF3478F7),
              ),
            ),
          ),
        ],
      );
  }
}