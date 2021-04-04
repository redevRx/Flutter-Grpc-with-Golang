import 'package:app/chat/repository/chat_repository.dart';

void main() async {
  ChatRepository repository = ChatRepository();
  for (int i = 0; i < 10; i++) {
    await repository.onSendMessage(message: "hi", name: "mao");
  }
}
