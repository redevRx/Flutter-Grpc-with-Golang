import 'package:app/chat/bloc/chat_bloc.dart';
import 'package:app/chat/bloc/chat_event.dart';
import 'package:app/chat/bloc/chat_state.dart';
import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key, this.chatBloc}) : super(key: key);
  final ChatBloc chatBloc;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              children: [
                //bloc chat
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .85,
                  child: BlocBuilder<ChatBloc, ChatState>(
                    bloc: chatBloc,
                    builder: (context, state) {
                      if (state is OnResponseMessage) {
                        var items = state.model.writeToJsonMap();

                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Text(
                                "name :${state.model.name} , message :${state.model.message}");
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),

                //text message

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: ClayContainer(
                    height: 50.0,
                    width: 350.0,
                    borderRadius: 16.0,
                    curveType: CurveType.convex,
                    child: TextFormField(
                      onChanged: (value) =>
                          chatBloc.add(OnMessageChange(message: value)),
                      onFieldSubmitted: (value) => chatBloc
                          .add(OnSendMessage(name: null, message: value)),
                      decoration: InputDecoration(
                          hintText: "Enter ..", border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
