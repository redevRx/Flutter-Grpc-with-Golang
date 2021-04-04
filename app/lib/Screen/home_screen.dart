import 'package:app/chat/bloc/chat_bloc.dart';
import 'package:app/widgets/appbar_widget.dart';
import 'package:app/widgets/btn_next_widget.dart';
import 'package:app/widgets/text_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatBloc = BlocProvider.of<ChatBloc>(context);
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //make app bar
            MyAppBar(),
            //
            //text name

            TextName(
              chatBloc: chatBloc,
            ),
            //
            ////button next
            ButtonNext(
              chatBloc: chatBloc,
            )
          ],
        ),
      ),
    ));
  }
}
