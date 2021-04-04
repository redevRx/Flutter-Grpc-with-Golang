import 'package:app/Screen/home_screen.dart';
import 'package:app/chat/bloc/chat_bloc.dart';
import 'package:app/chat/repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MaterialApp(
      home: SafeArea(
          child: BlocProvider(
        create: (context) => ChatBloc(new ChatRepository()),
        child: HomeScreen(),
      )),
    ));
