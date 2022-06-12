import 'dart:html';

import 'package:contacts_api/bloc/messages/messages_event.dart';

import '../../model/message_model.dart';
import '../contacts/contact_state.dart';

class MessageState{
  List<Message> messages;
  RequestState requestState;
  String errorMessage;
  ContactMessagesEvent currentEvent;
  MessageState({required this.messages, this.requestState=RequestState.NONE, this.errorMessage="",required this.currentEvent});
}