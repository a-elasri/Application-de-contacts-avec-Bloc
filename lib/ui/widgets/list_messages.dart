import 'package:flutter/material.dart';

import '../../bloc/messages/message_state.dart';

class ListMessagesWidget extends StatelessWidget {
  final MessageState state;
  const ListMessagesWidget({Key? key,required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController=ScrollController();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if(scrollController.hasClients){
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
    return Expanded(
      child: ListView.separated(
         controller: scrollController,
          itemBuilder: (context, index) {
            return ListTile(
              title: Container(
                  margin:(state.messages[index].sent==true)?EdgeInsets.only(left: 30) :EdgeInsets.only(right: 30),
                  padding: EdgeInsets.all(20),
                  color: (state.messages[index].sent==true)?Colors.grey[50]:Colors.green[50],
                  foregroundDecoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Text(state.messages[index].content,
                  )),
            );
          },
          separatorBuilder: (context,index)=>Divider(color: Colors.grey,height: 2),
          itemCount: state.messages.length),
    );
  }
}
