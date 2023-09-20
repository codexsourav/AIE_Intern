import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_message_event.dart';
part 'chat_message_state.dart';

class ChatMessageBloc extends Bloc<ChatMessageEvent, ChatMessageState> {
  ChatMessageBloc() : super(ChatMessageInitial());

  @override
  Future<void> close() {
    return super.close();
  }
}
