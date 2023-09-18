import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_home_state.dart';

class ChatHomeCubit extends Cubit<ChatHomeState> {
  ChatHomeCubit() : super(ChatHomeInitial());
}
