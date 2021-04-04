abstract class ChatEvent {}

class OnSendMessage extends ChatEvent {
  final String name;
  final String message;

  OnSendMessage({this.name, this.message});
}

class OnUserNameChange extends ChatEvent {
  final String name;

  OnUserNameChange({this.name});
}

class OnMessageChange extends ChatEvent {
  final String message;

  OnMessageChange({this.message});
}
