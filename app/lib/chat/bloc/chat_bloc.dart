import 'package:app/chat/bloc/chat_event.dart';
import 'package:app/chat/bloc/chat_state.dart';
import 'package:app/chat/repository/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatRepository repository;
  ChatBloc(ChatRepository repository) : super(null) {
    this.repository = repository;
  }
  SharedPreferences sharedPref;

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    sharedPref = await SharedPreferences.getInstance();
    if (event is OnSendMessage) {
      var name = sharedPref.getString("userName") != null
          ? sharedPref.getString("userName")
          : event.name;
      var message = sharedPref.getString("message") != null
          ? sharedPref.getString("message")
          : event.message;
      print("$name : $message");
      final model =
          await repository.onSendMessage(name: name, message: message);
      if (model != null) {
        yield OnResponseMessage(model: model);
      }
    }
    if (event is OnUserNameChange) {
      await sharedPref.remove("userName");
      await sharedPref.setString("userName", event.name);
    }
    if (event is OnMessageChange) {
      await sharedPref.remove("message");
      await sharedPref.setString("message", event.message);
    }
  }
}
