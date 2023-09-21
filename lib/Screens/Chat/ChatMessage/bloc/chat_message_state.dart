part of 'chat_message_bloc.dart';

@immutable
sealed class ChatMessageState {}

final class ChatMessageInitial extends ChatMessageState {}

final class ChatMessageShow extends ChatMessageState {
  final List message;
  ChatMessageShow({required this.message});
}
