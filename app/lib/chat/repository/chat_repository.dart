import 'dart:math';
import 'package:app/protobuf/api/chat.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class ChatRepository {
  //new instance client
  // ClientChannel channel = ClientChannel(
  //   'localhost',
  //   port: 3000,
  //   options: ChannelOptions(
  //     credentials: ChannelCredentials.insecure(),
  //     codecRegistry:
  //         CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  //   ),
  // );
  //
  //message client
  final messageClent = MessageServiceClient(new ClientChannel(
    '192.168.1.42',
    port: 3000,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  ));
  Future<ResponseMessage> onSendMessage({String message, String name}) async {
    try {
      //
      final requestMessage = RequestMessage(
          id: "${Random.secure().nextInt(100)}", message: message, name: name);

      //
      final response = await messageClent.onSend(requestMessage);
      print("message :${response.message} name:${response.name}");
      // await channel.shutdown();
      return response;
    } catch (e) {
      // await channel.shutdown();
      print("send grpc message error :${e}");
      return null;
    }
  }
}
