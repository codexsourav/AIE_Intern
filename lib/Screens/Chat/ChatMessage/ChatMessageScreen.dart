import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolpenintern/Screens/Chat/ChatMessage/bloc/chat_message_bloc.dart';
import 'package:schoolpenintern/Screens/Chat/Components/ChatBuble.dart';
import 'package:schoolpenintern/Screens/Chat/Components/ChatInput.dart';
import 'package:schoolpenintern/Theme/Colors/appcolors.dart';
import 'package:schoolpenintern/utiles/TimeToDays.dart';
import '../Components/ChatAppbar.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatMessageScreen extends StatefulWidget {
  final dynamic myid;
  final dynamic chatuserid;
  const ChatMessageScreen({super.key, this.myid, this.chatuserid});

  @override
  State<ChatMessageScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  late io.Socket socket;
  late String username;
  late String resiver;
  List chatsData = [];

  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    String serverUrl = 'http://192.168.101.88:6000/';

    username = widget.myid.toString();
    resiver = widget.chatuserid.toString();

    socket = io.io(serverUrl, <String, dynamic>{
      'transports': ['websocket'],
    });
    Bloc chat = BlocProvider.of<ChatMessageBloc>(context);

    socket.onConnect((data) {
      Map user = {"sender": username, "recipient": resiver};
      socket.emit('initConnect', user);
    });

    socket.on('getoldmessage', (data) {
      chatsData = data['messages'];

      chat.emit(ChatMessageShow(message: chatsData));
    });

    socket.on("new_private_message", (data) {
      chatsData.add({
        "sender": data['sender'],
        "recipient": data['resiver'],
        "message": data['message'],
        "created_at": data['created_at']
      });

      BlocProvider.of<ChatMessageBloc>(context)
          .emit(ChatMessageShow(message: chatsData));
      _textEditingController.clear();
      _scrollToBottom();
    });

    socket.on('nouserfound', (data) {
      Navigator.of(context).pop();
    });

    socket.connect();

    super.initState();
  }

  onSendMessage() {
    socket.emit("private_message", {
      "sender": username,
      "recipient": resiver,
      "message": _textEditingController.text
    });

    chatsData.add({
      "sender": username,
      "recipient": resiver,
      "message": _textEditingController.text,
      "created_at": DateTime.now().toString()
    });
    BlocProvider.of<ChatMessageBloc>(context)
        .emit(ChatMessageShow(message: chatsData));
    _textEditingController.clear();
    _scrollToBottom();
  }

  _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppbar(context),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatMessageBloc, ChatMessageState>(
              builder: (context, state) {
                if (state is ChatMessageInitial) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.purple,
                    ),
                  );
                }
                if (state is ChatMessageShow) {
                  List revmesg = state.message.reversed.toList();
                  return ListView.builder(
                      controller: _scrollController,
                      itemCount: revmesg.length,
                      reverse: true,
                      itemBuilder: (_, index) {
                        return ChatBubble(
                          resiver: revmesg[index]['recipient'] != resiver,
                          message: revmesg[index]['message'],
                          sendtext: revmesg.length == index - 1
                              ? changeTimeToDayOrHour(
                                  revmesg[index]['created_at'])
                              : null,
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.purple,
                    ),
                  );
                }
              },
            ),
          ),
          ChatInput(
            controller: _textEditingController,
            sendMessage: onSendMessage,
          ),
        ],
      ),
    );
  }
}
