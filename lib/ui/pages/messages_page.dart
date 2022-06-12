import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contacts/contact_state.dart';
import '../../bloc/messages/message_bloc.dart';
import '../../bloc/messages/message_state.dart';
import '../../bloc/messages/messages_event.dart';
import '../../model/contact_model.dart';
import '../../model/message_model.dart';
import '../widgets/button_reload_messages.dart';
import '../widgets/list_messages.dart';
class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController=TextEditingController();
    Contact contact=ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(title: Text("Messages")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            children: [BlocBuilder<MessageBloc,MessageState>(builder: (context, state) {
              if(state.requestState==RequestState.Loading){
                return CircularProgressIndicator();
              }else if (state.requestState==RequestState.Loaded){
                return ListMessagesWidget(state: state,);
              }else if(state.requestState==RequestState.Error){
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text("${state.errorMessage}"),
                      ButtonReloadMessage(state: state),
                    ],
                  ),
                );
              }else {
                return Container();
              }

            }),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        controller: editingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            )
                        ),
                      )),
                  IconButton(onPressed: (){
                    Message message=Message(
                        idContact: contact.id,
                        content: editingController.text,
                        sent: true
                    );
                    context.read<MessageBloc>().add(AddMessageEvent(message: message));
                  },
                      icon: Icon(Icons.send))
                ],
              )

            ]
        ),
      ),
    );
  }
}
