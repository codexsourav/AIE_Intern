import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolpenintern/Screens/Chat/ChatMessage/bloc/chat_message_bloc.dart';
import 'package:schoolpenintern/Screens/Chat/Components/ChatBuble.dart';
import 'package:schoolpenintern/Screens/Chat/Components/ChatInput.dart';
import '../Components/ChatAppbar.dart';
import 'package:http/http.dart' as http;

class ChatMessageScreen extends StatefulWidget {
  const ChatMessageScreen({super.key});

  @override
  State<ChatMessageScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  @override
  void initState() {
    String serverUrl = 'http://192.168.7.88:5000/';

    http.post(Uri.parse("$serverUrl/login"), body: {"username": "1"}).then(
        (http.Response value) {
      BlocProvider.of<ChatMessageBloc>(context).add(ChatMessageConnectEvent());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppbar(context),
      body: const Column(
        children: [
          Expanded(
            child: Column(children: [
              ChatBubble(resiver: true, message: "Hi", sendtext: "2 min ago"),
              ChatBubble(
                resiver: false,
                message: "Hello",
              ),
              ChatBubble(
                resiver: false,
                message: "How Are You?",
                sendtext: "2 min Ago",
              ),
            ]),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
