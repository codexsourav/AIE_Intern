import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

part 'chat_message_event.dart';
part 'chat_message_state.dart';

class ChatMessageBloc extends Bloc<ChatMessageEvent, ChatMessageState> {
  late io.Socket socket;
  ChatMessageBloc() : super(ChatMessageInitial()) {
    on<ChatMessageConnectEvent>((event, emit) {
      socket = io.io('http://192.168.7.88:5000', <String, dynamic>{
        'transports': ['websocket'],
      });

      socket.onConnect((s) {
        print('WebSocket connected successfully!');
      });

      // Connect to the server
      socket.connect();
    });
  }
  @override
  Future<void> close() {
    socket.dispose();
    return super.close();
  }
}
