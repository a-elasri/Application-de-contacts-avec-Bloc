import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/messages/message_bloc.dart';
import '../../bloc/messages/message_state.dart';

class ButtonReloadMessage extends StatelessWidget {
  final MessageState state;
  const ButtonReloadMessage({Key? key,required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      MessageBloc messageBloc=context.read<MessageBloc>();
      context.read<MessageBloc>().add(state.currentEvent);

    }, child: Text("Reload"));
  }
}
