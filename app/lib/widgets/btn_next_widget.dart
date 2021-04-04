import 'package:app/Screen/chat_screen.dart';
import 'package:app/chat/bloc/chat_bloc.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({
    Key key,
    this.chatBloc,
  }) : super(key: key);
  final ChatBloc chatBloc;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              chatBloc: chatBloc,
            ),
          )),
      child: ClayContainer(
        height: 50.0,
        width: 150.0,
        curveType: CurveType.convex,
        child: Center(
          child: Text(
            "Next",
            style: GoogleFonts.roboto(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
