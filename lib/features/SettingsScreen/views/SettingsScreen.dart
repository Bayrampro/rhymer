import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/bloc/theme/theme_cubit.dart';
import 'package:rhymer/ui/theme/theme.dart';
import 'Widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  void _dialogForConfirmDelete(){
    final theme = Theme.of(context);
    if(theme.isAndroid)
      showDialog(
          context: context,
          builder: (context) => AlertWindow()
      );
    else
      showCupertinoDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertWindow()
      );
  }

  void _support(){
    final theme = Theme.of(context);
    if(theme.isAndroid)
      showModalBottomSheet(
          backgroundColor: theme.cardColor,
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(24).copyWith(top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close,
                          color: theme.dangerActionColor,
                        )
                    ),
                  ],
                ),
                SizedBox(height: 12,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {

                    },
                    label: Text('Write to Telegram'),
                    icon: Icon(Icons.telegram),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      foregroundColor: theme.canvasColor,
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {

                    },
                    label: Text('Write to Email'),
                    icon: Icon(Icons.mail),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: theme.primaryColor, // Set the border color
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
      );
    else
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            title: const Text('Support'),
            message: const Text('We are always online'),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                  onPressed: (){},
                  child: Text(
                      'Write to Telegram',
                      style: TextStyle(
                        color: Color(0xFF3478F7),
                      ),
                  ),
              ),
              CupertinoActionSheetAction(
                onPressed: (){},
                child: Text(
                    'Write to Email',
                    style: TextStyle(
                      color: Color(0xFF3478F7),
                    ),
                ),
              ),
            ],
          ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<ThemeCubit>().state.isDark;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          title: Text('Settings'),
          centerTitle: true,
          backgroundColor: Theme.of(context).canvasColor,
          surfaceTintColor: Colors.transparent,
        ),
        SliverToBoxAdapter(child: SizedBox(height: 8,),),
        SliverToBoxAdapter(
          child: SettingsToggle(
            value: isDark,
            onChanged: (v){
              context.read<ThemeCubit>().setThemeBrightness(v ? Brightness.dark : Brightness.light);
            },
            title: 'Dark Theme',
          ),
        ),
        SliverToBoxAdapter(
          child: SettingsToggle(value: false, onChanged: (v){}, title: 'Notifications',),
        ),
        SliverToBoxAdapter(
          child: SettingsToggle(value: true, onChanged: (v){}, title: 'Allow analyzing',),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 8,),),
        SliverToBoxAdapter(
          child: SettingsAction(
            title: 'Delete history',
            iconData: Icons.delete_sweep_outlined,
            iconColor: Theme.of(context).primaryColor,
            onTap: () {
              _dialogForConfirmDelete();
            },
          ),
        ),
        SliverToBoxAdapter(
          child: SettingsAction(
            title: 'Support',
            iconData: Icons.message_outlined,
            onTap: () {
              _support();
            },
          ),
        ),
      ],
    );
  }
}
