// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'chat_home_state.dart';

class ChatHomeCubit extends Cubit<ChatHomeState> {
  ChatHomeCubit() : super(ChatHomeInitial());
}
