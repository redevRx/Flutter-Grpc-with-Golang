import 'package:app/chat/bloc/chat_bloc.dart';
import 'package:app/chat/bloc/chat_event.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextName extends StatelessWidget {
  const TextName({
    Key key,
    this.chatBloc,
  }) : super(key: key);
  final ChatBloc chatBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 150.0,
      ),
      child: ClayContainer(
        width: 350.0,
        height: 50.0,
        borderRadius: 16.0,
        curveType: CurveType.convex,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            onChanged: (value) => chatBloc.add(OnUserNameChange(name: value)),
            onFieldSubmitted: (name) {
              chatBloc.add(OnUserNameChange(name: name));
            },
            decoration: InputDecoration(
                hintText: "Enter Your Name",
                hintStyle: GoogleFonts.roboto(fontSize: 18.0),
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
