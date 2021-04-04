import 'package:app/protobuf/api/chat.pbgrpc.dart';

abstract class ChatState {}

class OnResponseMessage extends ChatState {
  final ResponseMessage model;

  OnResponseMessage({this.model});
}
