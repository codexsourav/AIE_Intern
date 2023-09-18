part of 'chat_message_bloc.dart';

@immutable
sealed class ChatMessageEvent {}

class ChatMessageConnectEvent extends ChatMessageEvent {}
