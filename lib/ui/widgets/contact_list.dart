import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contacts/contact_state.dart';
import '../../bloc/messages/message_bloc.dart';
import '../../bloc/messages/messages_event.dart';

class ContactListView extends StatelessWidget {
  final ContactState state;
  const ContactListView({Key? key,required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context,index)=>Divider(color: Colors.grey,height: 3),
        itemCount: state.contacts.length,
        itemBuilder: (context,index){
          return ListTile(
            onTap: (){
              context.read<MessageBloc>().add(ContactMessagesEvent(contact: state.contacts[index]));
              Navigator.pushNamed(context, "/messages",arguments:state.contacts[index] );
            },
            leading: CircleAvatar(child: Text("${state.contacts[index].profile}")),
            title: Text(state.contacts[index].name),
          ) ;
        });
  }
}
