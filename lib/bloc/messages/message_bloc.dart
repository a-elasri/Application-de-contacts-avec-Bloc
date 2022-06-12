import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/message_model.dart';
import '../../repositories/message_repository.dart';
import '../contacts/contact_state.dart';
import 'message_state.dart';
import 'messages_event.dart';

class MessageBloc extends Bloc<MessageEvent,MessageState>{
  MessageRepository messageRepository;
  MessageBloc({required MessageState initialState,required this.messageRepository}) : super(initialState){

    on<ContactMessagesEvent>((event, emit) async{

        emit(MessageState(messages: [],requestState: RequestState.Loading,currentEvent: event));
        try{
          List<Message> messages=await messageRepository.messagesByContact(event.contact.id);
          emit(MessageState(messages: messages,requestState: RequestState.Loaded,currentEvent: event));
        }catch(e){
          emit(MessageState(messages: [],requestState: RequestState.Error,errorMessage: e.toString(),currentEvent: event));
        }

    });
    //
    // // on send message
    // on<AddMessageEvent>((event, emit) async {
    //   emit(MessageState(
    //       messages: [],
    //       requestState: RequestState.Loading,
    //       currentEvent: event));
    //   try {
    //     messageRepository.addMessage(event.message,event.id);
    //     emit(MessageState(
    //         messages: await messageRepository.messagesByContact(event.id),
    //         requestState: RequestState.Loaded,
    //         currentEvent: event));
    //   } catch (e) {
    //     emit(MessageState(
    //         messages: [],
    //         requestState: RequestState.Error,
    //         errorMessage: e.toString(),
    //         currentEvent: event));
    //   }
    // });

  }

}